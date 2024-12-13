import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/core/notifications/local_notification_service.dart';

class TasbeehCounterScreenBody extends StatefulWidget {
  const TasbeehCounterScreenBody({super.key});

  @override
  _TasbeehCounterScreenBodyState createState() =>
      _TasbeehCounterScreenBodyState();
}

class _TasbeehCounterScreenBodyState extends State<TasbeehCounterScreenBody> {
  int _counter = 1; // عداد التسبيح

  void _incrementCounter() {
    setState(() {
      _counter++; // زيادة العداد
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0; // إعادة العداد إلى الصفر
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("عداد التسبيح"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // الرقم في المنتصف
            CircleAvatar(
              radius: 80, // حجم الدائرة
              backgroundColor: Colors.teal,
              child: Text(
                '$_counter', // الرقم الحالي
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // زر زيادة العداد
            ElevatedButton(
              onPressed: _incrementCounter,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                backgroundColor: Colors.teal,
              ),
              child: const Text(
                "تسبيح",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            // زر إعادة التعيين
            TextButton(
              onPressed: _resetCounter,
              child: const Text(
                "إعادة التعيين",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 5,
            ),

            GestureDetector(
              onTap: () {
                // LocalNotificationService.showBasicNotification();
              },
              child: const Text(
                "showBasicNotification",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                // LocalNotificationService.showRepeatedNotification();
              },
              child: const Text(
                "showBasicNotification",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                // LocalNotificationService.scheduleNotification(title: '', body: '', scheduledTime: , id: 1);
              },
              child: const Text(
                "showSchedule Notification",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
