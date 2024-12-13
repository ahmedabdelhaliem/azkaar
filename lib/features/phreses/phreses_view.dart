import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortress_of_the_muslim/core/utils/assets.dart';
import 'package:fortress_of_the_muslim/features/home/home_view.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/view/maneger/cubit.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/view/maneger/state.dart';
import 'package:fortress_of_the_muslim/features/phreses/widget/phreses_view_body.dart';
import 'package:fortress_of_the_muslim/features/tasbeh/tasbeh_view.dart';
import 'package:fortress_of_the_muslim/pray/pray_time_view.dart';

class PhresesView extends StatefulWidget {
  final String category;

  const PhresesView({super.key, required this.category});

  @override
  State<PhresesView> createState() => _PhresesViewState();
}

class _PhresesViewState extends State<PhresesView> {
  @override
  Widget build(BuildContext context) {
    context.read<AdkarCubit>().fetchAdkar(widget.category);
    int selectedIndex = 0; // تحديد العنصر المحدد في BottomNavigationBar

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white.withOpacity(.8),
        selectedItemColor: Colors.amber[900], // لون العنصر المحدد
        unselectedItemColor: Colors.grey, // لون العناصر غير المحددة
        currentIndex: selectedIndex, // تحديد العنصر المحدد
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              Images.quran,
              height: 24,
              width: 24,
            ),
            label: 'اذكار',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Images.taspih,
              height: 24,
              width: 24,
            ),
            label: 'تسبيح',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Images.mosque,
              height: 24,
              width: 24,
            ),
            label: 'مسجد',
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index; // تحديث العنصر المحدد
          });

          // التعامل مع التنقل بناءً على `index`
          if (index == 0) {
            // انتقل إلى صفحة الأذكار
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
          } else if (index == 1) {
            // انتقل إلى صفحة التسبيح
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TasbeehCounterScreenBody(),
              ),
            );
          } else if (index == 2) {
            // انتقل إلى صفحة مواقيت الصلاة
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PrayerTimesScreen(city: 'Cairo'),
              ),
            );
          }
        },
      ),
      appBar: AppBar(
        title: Text(widget.category),
        centerTitle: true,
      ),
      body: BlocBuilder<AdkarCubit, AdkarStates>(
        builder: (context, state) {
          if (state is AdkarLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AdkarError) {
            return Center(child: Text(state.error));
          } else if (state is AdkarLoaded) {
            return PhresesViewBody(adkarList: state.adkar);
          } else {
            return const Center(child: Text("لا توجد بيانات لعرضها."));
          }
        },
      ),
    );
  }
}
