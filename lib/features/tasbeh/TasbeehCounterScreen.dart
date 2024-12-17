import 'package:flutter/material.dart';

class TasbeehCounterScreen extends StatefulWidget {
  const TasbeehCounterScreen({super.key});

  @override
  _TasbeehCounterScreenState createState() => _TasbeehCounterScreenState();
}

class _TasbeehCounterScreenState extends State<TasbeehCounterScreen> {
  int _counter = 0; // عداد التسبيح الحالي
  int _totalCount = 0; // إجمالي عدد التسبيحات اليومية

  void _incrementCounter() {
    setState(() {
      if (_counter < 100) {
        _counter++; // زيادة العداد
      }
      if (_counter == 100) {
        _addToTotalCount();
      }
    });
  }

  void _addToTotalCount() {
    setState(() {
      _totalCount += _counter; // إضافة العدد إلى الإجمالي
      _counter = 0; // إعادة تعيين العداد الحالي
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0; // إعادة العداد الحالي إلى الصفر
    });
  }

  void _clearRecord() {
    setState(() {
      _totalCount = 0; // إعادة تعيين الإجمالي
      _counter = 0; // إعادة العداد الحالي إلى الصفر
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "عداد التسبيح",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        width: double.infinity, // ملء الشاشة عرضًا
        height: double.infinity, // ملء الشاشة طولًا
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.greenAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, // تصغير حجم العمود ليكون في المنتصف
            children: [
              // العداد الحالي
              CircleAvatar(
                radius: 90,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.teal,
                  child: Text(
                    '$_counter',
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // زر زيادة العداد
              ElevatedButton.icon(
                onPressed: _incrementCounter,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                icon: const Icon(Icons.add, size: 24, color: Colors.white),
                label: const Text(
                  "تسبيح",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              // زر إعادة التعيين
              TextButton.icon(
                onPressed: _resetCounter,
                icon: const Icon(Icons.refresh, color: Colors.red),
                label: const Text(
                  "إعادة التعيين",
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
              const SizedBox(height: 20),
              // الإجمالي اليومي
              const Text(
                "الإجمالي اليومي:",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "$_totalCount",
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // زر مسح السجل
              TextButton.icon(
                onPressed: _clearRecord,
                icon: const Icon(Icons.delete, color: Colors.red),
                label: const Text(
                  "مسح السجل",
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
