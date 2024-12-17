// import 'package:fortress_of_the_muslim/core/notifications/local_notification_service.dart';
// import 'package:workmanager/workmanager.dart';

// class WorkManagerService {
//   void registerMyTask() async {
//     // تسجل المهمة لإرسال الإشعارات بشكل دوري كل دقيقة
//     await Workmanager().registerPeriodicTask(
//       'id1',
//       'send prayer notifications',
//       frequency: const Duration(minutes: 1), // إرسال المهمة كل دقيقة
//       initialDelay: const Duration(seconds: 5), // تأخير البداية قليلاً
//     );
//   }

//   // تهيئة خدمة Workmanager
//   Future<void> init() async {
//     await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
//     registerMyTask();
//   }

//   void cancelTask(String id) {
//     Workmanager().cancelAll();
//   }
// }

// @pragma('vm-entry-point')
// void callbackDispatcher() {
//   Workmanager().executeTask((taskName, inputData) async {
//     // استدعاء دالة عرض الإشعار (لإرسال الإشعار في الوقت المناسب)
//     // await LocalNotificationService.scheduleNotification();
//     return Future.value(true);
//   });
// }
