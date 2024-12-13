// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:fortress_of_the_muslim/core/utils/api_service_azaan.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:flutter_timezone/flutter_timezone.dart';

// class LocalNotificationService {
//   static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static Future<void> init() async {
//     InitializationSettings initializationSettings =
//         const InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//     );
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   static Future<void> schedulePrayerNotification({
//     required String title,
//     required String body,
//     required DateTime scheduledTime,
//     required int id,
//   }) async {
//     const NotificationDetails notificationDetails = NotificationDetails(
//       android: AndroidNotificationDetails(
//         'scheduled_channel',
//         'Scheduled Notifications',
//         importance: Importance.max,
//         priority: Priority.high,
//       ),
//     );

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       tz.TZDateTime.from(scheduledTime, tz.local),
//       notificationDetails,
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }

//   static Future<void> scheduleAllPrayerNotifications(String city) async {
//     try {
//       // الحصول على أوقات الصلاة من API
//       final prayerTimesService = PrayerTimesService();
//       final data = await prayerTimesService.fetchPrayerTimes(city);

//       // استخراج أوقات الصلاة
//       final prayerTimes = data['items'][0];

//       // تحديد أوقات الصلاة
//       final fajrTime = DateTime.parse(prayerTimes['fajr']);
//       final dhuhrTime = DateTime.parse(prayerTimes['dhuhr']);
//       final asrTime = DateTime.parse(prayerTimes['asr']);
//       final maghribTime = DateTime.parse(prayerTimes['maghrib']);
//       final ishaTime = DateTime.parse(prayerTimes['isha']);

//       // إرسال إشعارات لكل وقت صلاة
//       await schedulePrayerNotification(
//         title: "Fajr Prayer Time",
//         body: "It's time for Fajr prayer",
//         scheduledTime: fajrTime,
//         id: 1,
//       );
//       await schedulePrayerNotification(
//         title: "Dhuhr Prayer Time",
//         body: "It's time for Dhuhr prayer",
//         scheduledTime: dhuhrTime,
//         id: 2,
//       );
//       await schedulePrayerNotification(
//         title: "Asr Prayer Time",
//         body: "It's time for Asr prayer",
//         scheduledTime: asrTime,
//         id: 3,
//       );
//       await schedulePrayerNotification(
//         title: "Maghrib Prayer Time",
//         body: "It's time for Maghrib prayer",
//         scheduledTime: maghribTime,
//         id: 4,
//       );
//       await schedulePrayerNotification(
//         title: "Isha Prayer Time",
//         body: "It's time for Isha prayer",
//         scheduledTime: ishaTime,
//         id: 5,
//       );
//     } catch (e) {
//       print("Error scheduling prayer notifications: $e");
//     }
//   }
// }
