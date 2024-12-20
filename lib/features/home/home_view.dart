import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/core/widget/bottom_nav_bar.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/view/widget/home_view_body.dart';
import 'package:fortress_of_the_muslim/features/tasbeh/TasbeehCounterScreen.dart';
import 'package:fortress_of_the_muslim/pray/pray_time_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  // قائمة بالصفحات المتاحة
  final List<Widget> _pages = const [
    HomeViewBody(), // الصفحة الرئيسية
    TasbeehCounterScreen(), // صفحة التسبيح
    PrayerTimesScreen(), // صفحة مواقيت الصلاة
  ];

  // دالة لتغيير الصفحة بناءً على اختيار العنصر من BottomNavigationBar
  void _onItemSelected(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // إخفاء bottomNavigationBar في الصفحات التي لا نحتاج إليها مثل صفحة التسبيح ومواقيت الصلاة
    bool showNavigationBar = currentIndex == 0;

    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: _pages[currentIndex], // عرض الصفحة بناءً على الاختيار
      bottomNavigationBar: showNavigationBar
          ? CustomNavigationBar(
              currentIndex: currentIndex,
              onItemSelected: _onItemSelected, // تمرير دالة التحديد
            )
          : null, // إخفاء NavigationBar في الصفحات الأخرى
    );
  }
}
