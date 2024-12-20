import 'package:workmanager/workmanager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'local_notification_service.dart';
import 'dart:io';

class WorkManagerService {
  void registerMyTask() async {
    await Workmanager().registerPeriodicTask(
      'id1',
      'sendPrayerNotifications',
      frequency: const Duration(minutes: 15),
      initialDelay: const Duration(seconds: 5),
    );
  }

  Future<void> init() async {
    await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
    registerMyTask();
  }

  void cancelTask() {
    Workmanager().cancelAll();
  }
}

@pragma('vm-entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    final now = DateTime.now();
    // تحديد الفترات الزمنية المسموح بها
    if ( // من 12:30 إلى 12:59 صباحًا
        (now.hour > 3 && now.hour < 10) || // من 1:00 صباحًا إلى 9:59 صباحًا
            (now.hour >= 18 && now.hour < 20) // من 6:00 مساءً إلى 7:59 مساءً
        ) {
      final prefs = await SharedPreferences.getInstance();
      int lastIndex = prefs.getInt('last_notification_index') ?? 0;

      await LocalNotificationService.showSingleNotification(lastIndex);

      lastIndex = (lastIndex + 1) % 80; // تعديل عدد الأذكار حسب القائمة
      await prefs.setInt('last_notification_index', lastIndex);
    }

    return Future.value(true);
  });
}
