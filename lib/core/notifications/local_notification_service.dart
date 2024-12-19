import 'dart:async';
import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  // static StreamController<NotificationResponse> streamController =
  //     StreamController();
  static onTap(NotificationResponse notificationResponse) {
    // log(notificationResponse.id!.toString());
    // log(notificationResponse.payload!.toString());
    // streamController.add(notificationResponse);
    // Navigator.push(context, route);
  }

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  //basic Notification
  static void showBasicNotification() async {
    AndroidNotificationDetails android = AndroidNotificationDetails(
        'id 1', 'basic notification',
        importance: Importance.max,
        priority: Priority.high,
        sound:
            RawResourceAndroidNotificationSound('sound.wav'.split('.').first));
    NotificationDetails details = NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'Baisc Notification',
      'body',
      details,
      payload: "Payload Data",
    );
  }

  //basic Notification2
  static void showBasicNotification2() async {
    AndroidNotificationDetails android = AndroidNotificationDetails(
        'id 3', 'basic notification1',
        importance: Importance.max,
        priority: Priority.high,
        sound:
            RawResourceAndroidNotificationSound('sound.wav'.split('.').first));
    NotificationDetails details = NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.show(
      4,
      'Basic Notification',
      'body',
      details,
      payload: "Payload Data",
    );
  }

  //showRepeatedNotification
  static void showRepeatedNotification() async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'id 2',
      'repeated notification',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = const NotificationDetails(
      android: android,
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'Reapated Notification',
      'body',
      RepeatInterval.daily,
      details,
      payload: "Payload Data",
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  //showSchduledNotification
  static void showSchduledNotification() async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'schduled notification',
      'id 3',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails details = const NotificationDetails(
      android: android,
    );
    tz.initializeTimeZones();
    log(tz.local.name);
    log("Before ${tz.TZDateTime.now(tz.local).hour}");
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    log(currentTimeZone);
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    log(tz.local.name);
    log("After ${tz.TZDateTime.now(tz.local).hour}");
    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      'Schduled Notification',
      'body', androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,

      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10)),
      // tz.TZDateTime(
      //   tz.local,
      //   2024,
      //   2,
      //   10,
      //   21,
      //   30,
      // ),
      details,
      payload: 'zonedSchedule',
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  //showDailySchduledNotification

  static Future<void> showSingleNotification(int index) async {
    const AndroidNotificationDetails android = AndroidNotificationDetails(
      'daily_scheduled_notifications',
      'Scheduled Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(android: android);

    List<Map<String, String>> adkarList = [
      {
        "category": "أذكار المساء",
        "count": "03",
        "description": "",
        "reference": "",
        "content":
            "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ الْهَمِّ وَالْحَزَنِ، وَأَعُوذُ بِكَ مِنْ الْعَجْزِ وَالْكَسَلِ، وَأَعُوذُ بِكَ مِنْ الْجُبْنِ وَالْبُخْلِ، وَأَعُوذُ بِكَ مِنْ غَلَبَةِ الدَّيْنِ، وَقَهْرِ الرِّجَالِ."
      },
      {
        "category": "أذكار المساء",
        "count": "03",
        "description": "",
        "reference": "",
        "content":
            "أسْتَغْفِرُ اللهَ العَظِيمَ الَّذِي لاَ إلَهَ إلاَّ هُوَ، الحَيُّ القَيُّومُ، وَأتُوبُ إلَيهِ."
      },
      {
        "category": "أذكار المساء",
        "count": "03",
        "description": "",
        "reference": "",
        "content":
            "يَا رَبِّ , لَكَ الْحَمْدُ كَمَا يَنْبَغِي لِجَلَالِ وَجْهِكَ , وَلِعَظِيمِ سُلْطَانِكَ."
      },
      {
        "category": "أذكار المساء",
        "count": "100",
        "description":
            "كانت له عدل عشر رقاب، وكتبت له مئة حسنة، ومحيت عنه مئة سيئة، وكانت له حرزا من الشيطان.",
        "reference": "",
        "content":
            "لَا إلَه إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءِ قَدِيرِ."
      }
    ];

    if (index < adkarList.length) {
      var currentAdkar = adkarList[index];

      await flutterLocalNotificationsPlugin.show(
        index, // معرف فريد
        currentAdkar['category'], // العنوان
        currentAdkar['content'], // المحتوى
        details,
      );
    }
  }

  static Future<void> scheduleNotification(String prayer, String time) async {
    const androidDetails = AndroidNotificationDetails(
      'prayer_notifications',
      'Prayer Notifications',
      channelDescription: 'Notifications for prayer times',
      importance: Importance.max,
      priority: Priority.high,
    );
    const notificationDetails = NotificationDetails(android: androidDetails);

    final now = tz.TZDateTime.now(tz.local);
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

    // تحويل الوقت إلى صيغة 24 ساعة
    final timeFormat =
        RegExp(r'(\d{1,2}):(\d{2})\s?(AM|PM)', caseSensitive: false);
    final match = timeFormat.firstMatch(time);

    if (match == null) {
      throw FormatException('Invalid time format: $time');
    }

    int hour = int.parse(match.group(1)!);
    final int minute = int.parse(match.group(2)!);
    final String period = match.group(3)!.toUpperCase();

    if (period == 'PM' && hour != 12) {
      hour += 12; // تحويل الساعة إلى 24 ساعة في حالة PM
    } else if (period == 'AM' && hour == 12) {
      hour = 0; // منتصف الليل
    }

    final notificationTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    flutterLocalNotificationsPlugin.zonedSchedule(
      prayer.hashCode,
      'موعد الصلاة',
      'حان الآن موعد صلاة $prayer',
      notificationTime,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static void cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}

//1.setup. [Done]
//2.Basic Notification. [Done]
//3.Repeated Notification. [Done]
//4.Scheduled Notification. [Done]
//5.Custom Sound. [Done]
//6.on Tab. [Done]
//7.Daily Notifications at specific time. [Done]
//8.Real Example in To Do App.
