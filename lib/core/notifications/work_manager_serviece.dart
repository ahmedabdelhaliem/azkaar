import 'package:workmanager/workmanager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'local_notification_service.dart';

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
    final prefs = await SharedPreferences.getInstance();
    int lastIndex = prefs.getInt('last_notification_index') ?? 0;

    await LocalNotificationService.showSingleNotification(lastIndex);

    lastIndex = (lastIndex + 1) % 80; // افترض أن لديك 5 أذكار
    await prefs.setInt('last_notification_index', lastIndex);

    return Future.value(true);
  });
}
