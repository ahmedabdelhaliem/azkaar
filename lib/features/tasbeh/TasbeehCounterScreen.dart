import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/core/utils/app_router.dart';
import 'package:fortress_of_the_muslim/core/widget/bottom_nav_bar.dart';
import 'package:fortress_of_the_muslim/features/tasbeh/CounterDisplay%20.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasbeehCounterScreen extends StatefulWidget {
  const TasbeehCounterScreen({super.key});

  @override
  _TasbeehCounterScreenState createState() => _TasbeehCounterScreenState();
}

class _TasbeehCounterScreenState extends State<TasbeehCounterScreen> {
  int currentIndex = 1;
  int _counter = 0;
  int _totalCount = 0;

  @override
  void initState() {
    super.initState();
    _loadTasbeehCounts();
  }

  // دالة لتحميل الأعداد من SharedPreferences
  Future<void> _loadTasbeehCounts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
      _totalCount = prefs.getInt('totalCount') ?? 0;
    });
  }

  // دالة لحفظ الأعداد في SharedPreferences
  Future<void> _saveTasbeehCounts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', _counter);
    await prefs.setInt('totalCount', _totalCount);
  }

  void _incrementCounter() {
    setState(() {
      if (_counter < 100) {
        _counter++;
      }
      if (_counter == 100) {
        _addToTotalCount();
      }
    });
    _saveTasbeehCounts();
  }

  void _addToTotalCount() {
    setState(() {
      _totalCount += _counter;
      _counter = 0;
    });
    _saveTasbeehCounts();
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    _saveTasbeehCounts();
  }

  void _clearRecord() {
    setState(() {
      _totalCount = 0;
      _counter = 0;
    });
    _saveTasbeehCounts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("عداد التسبيح", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            GoRouter.of(context).go(AppRouter.kHomeView);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.greenAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CounterDisplay(counter: _counter),
                  const SizedBox(height: 30),
                  IncrementButton(onPressed: _incrementCounter),
                  const SizedBox(height: 20),
                  ResetButton(onPressed: _resetCounter),
                  const SizedBox(height: 20),
                  TotalCountDisplay(totalCount: _totalCount),
                  const SizedBox(height: 20),
                  ClearRecordButton(onPressed: _clearRecord),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
