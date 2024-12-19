import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/core/utils/assets.dart';
import 'package:fortress_of_the_muslim/core/widget/bottom_nav_bar.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/view/widget/azker_category_view.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/view/widget/home_view_body.dart';
import 'package:fortress_of_the_muslim/features/tasbeh/TasbeehCounterScreen.dart';
import 'package:fortress_of_the_muslim/features/tasbeh/tasbeh_view.dart';
import 'package:fortress_of_the_muslim/pray/pray_time_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  void _onItemSelected(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: const HomeViewBody(), // تحميل الصفحة بناءً على الاختيار
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onItemSelected: _onItemSelected,
      ),
    );
  }

  Widget _getPageForIndex(int index) {
    if (index == 0) {
      return const HomeViewBody(); // الصفحة الرئيسية
    } else if (index == 1) {
      return const TasbeehCounterScreen(); // صفحة التسبيح
    } else {
      return const PrayerTimesScreen(); // صفحة مواقيت الصلاة
    }
  }
}
