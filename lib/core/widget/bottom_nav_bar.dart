import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/core/utils/app_router.dart';
import 'package:fortress_of_the_muslim/core/utils/assets.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white.withOpacity(.8),
      selectedItemColor: Colors.amber[900], // اللون المحدد
      unselectedItemColor: Colors.grey, // اللون غير المحدد
      currentIndex: currentIndex, // تعيين العنصر المحدد
      onTap: (index) {
        onItemSelected(index); // تغيير العنصر المحدد
        _navigateToPage(context, index);
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            Images.quran,
            height: 30,
            width: 30,
          ),
          label: 'اذكار',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            Images.taspih,
            height: 30,
            width: 30,
          ),
          label: 'تسبيح',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            Images.mosque,
            height: 30,
            width: 30,
          ),
          label: 'مسجد',
        ),
      ],
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    if (index == 0) {
      GoRouter.of(context).push(AppRouter.kHomeView); // الصفحة الرئيسية
    } else if (index == 1) {
      GoRouter.of(context)
          .push(AppRouter.kTasbeehCounterScreen); // صفحة التسبيح
    } else if (index == 2) {
      GoRouter.of(context).push(AppRouter.kPrayerTimesScreen); // صفحة الصلاة
    }
  }
}
