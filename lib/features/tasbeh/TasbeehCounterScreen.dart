import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/features/home/home_view.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/view/widget/home_view_body.dart';
import 'package:fortress_of_the_muslim/features/tasbeh/tasbeh_view.dart';
import 'package:fortress_of_the_muslim/pray/pray_time_view.dart';

import '../../core/widget/bottom_nav_bar.dart';

class Tasbeehcounterscreen extends StatefulWidget {
  const Tasbeehcounterscreen({super.key});

  @override
  State<Tasbeehcounterscreen> createState() => _TasbeehcounterscreenState();
}

class _TasbeehcounterscreenState extends State<Tasbeehcounterscreen> {
  int currentIndex = 1;

  void _onItemSelected(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const TasbeehCounterScreenBody(),
      // تحميل الصفحة بناءً على الاختيار
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onItemSelected: _onItemSelected,
      ),
    );
  }
}
