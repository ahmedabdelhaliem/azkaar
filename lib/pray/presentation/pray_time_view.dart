import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortress_of_the_muslim/core/notifications/local_notification_service.dart';
import 'package:fortress_of_the_muslim/pray/data/domain/cubit.dart';
import 'package:fortress_of_the_muslim/pray/data/domain/state_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pray_time_card.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  // خريطة لحفظ حالة الإشعارات
  final Map<String, bool> _notificationSettings = {
    'الفجر': false,
    'الظهر': false,
    'العصر': false,
    'المغرب': false,
    'العشاء': false,
  };

  @override
  void initState() {
    super.initState();
    _loadNotificationSettings(); // تحميل الإعدادات عند بدء التطبيق
  }

  // دالة لتحميل الإعدادات من SharedPreferences
  Future<void> _loadNotificationSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _notificationSettings['الفجر'] =
          prefs.getBool(_getKeyForPrayer('الفجر')) ?? false;
      _notificationSettings['الظهر'] =
          prefs.getBool(_getKeyForPrayer('الظهر')) ?? false;
      _notificationSettings['العصر'] =
          prefs.getBool(_getKeyForPrayer('العصر')) ?? false;
      _notificationSettings['المغرب'] =
          prefs.getBool(_getKeyForPrayer('المغرب')) ?? false;
      _notificationSettings['العشاء'] =
          prefs.getBool(_getKeyForPrayer('العشاء')) ?? false;
    });
  }

  // دالة لحفظ إعدادات الإشعارات في SharedPreferences
  Future<void> _saveNotificationSettings(String prayer, bool isEnabled) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_getKeyForPrayer(prayer), isEnabled);
  }

  // دالة للحصول على المفتاح الفريد لكل صلاة
  String _getKeyForPrayer(String prayer) {
    switch (prayer) {
      case 'الفجر':
        return 'notification_fajr';
      case 'الظهر':
        return 'notification_dhuhr';
      case 'العصر':
        return 'notification_asr';
      case 'المغرب':
        return 'notification_maghrib';
      case 'العشاء':
        return 'notification_isha';
      default:
        return 'notification_unknown';
    }
  }

  // دالة لتفعيل أو إلغاء تفعيل الإشعار
  void _toggleNotification(String prayer, bool isEnabled, String? time) {
    setState(() {
      _notificationSettings[prayer] = isEnabled;
    });

    if (isEnabled && time != null) {
      LocalNotificationService.scheduleNotification(
          prayer, time); // إنشاء الإشعار
    } else {
      LocalNotificationService.cancelNotification(
          prayer.hashCode); // إلغاء الإشعار
    }

    _saveNotificationSettings(prayer, isEnabled); // حفظ الحالة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'مواقيت الصلاة - Cairo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
        builder: (context, state) {
          if (state is PrayerTimesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PrayerTimesLoaded) {
            final times = state.prayerTimes.items?.first;

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                PrayerTimeCard(
                  title: 'الفجر',
                  time: times?.fajr ?? 'غير متوفر',
                  icon: Icons.wb_sunny,
                  color: Colors.blue,
                  isNotificationEnabled: _notificationSettings['الفجر']!,
                  onNotificationToggle: (isEnabled) =>
                      _toggleNotification('الفجر', isEnabled, times?.fajr),
                ),
                PrayerTimeCard(
                  title: 'الظهر',
                  time: times?.dhuhr ?? 'غير متوفر',
                  icon: Icons.sunny,
                  color: Colors.orange,
                  isNotificationEnabled: _notificationSettings['الظهر']!,
                  onNotificationToggle: (isEnabled) =>
                      _toggleNotification('الظهر', isEnabled, times?.dhuhr),
                ),
                PrayerTimeCard(
                  title: 'العصر',
                  time: times?.asr ?? 'غير متوفر',
                  icon: Icons.cloud,
                  color: Colors.brown,
                  isNotificationEnabled: _notificationSettings['العصر']!,
                  onNotificationToggle: (isEnabled) =>
                      _toggleNotification('العصر', isEnabled, times?.asr),
                ),
                PrayerTimeCard(
                  title: 'المغرب',
                  time: times?.maghrib ?? 'غير متوفر',
                  icon: Icons.nightlight_round,
                  color: Colors.red,
                  isNotificationEnabled: _notificationSettings['المغرب']!,
                  onNotificationToggle: (isEnabled) =>
                      _toggleNotification('المغرب', isEnabled, times?.maghrib),
                ),
                PrayerTimeCard(
                  title: 'العشاء',
                  time: times?.isha ?? 'غير متوفر',
                  icon: Icons.nightlife,
                  color: Colors.purple,
                  isNotificationEnabled: _notificationSettings['العشاء']!,
                  onNotificationToggle: (isEnabled) =>
                      _toggleNotification('العشاء', isEnabled, times?.isha),
                ),
              ],
            );
          } else if (state is PrayerTimesError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 50),
                  const SizedBox(height: 10),
                  Text(
                    'خطأ: ${state.error}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PrayerTimesCubit>().fetchPrayerTimes();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                    ),
                    child: const Text(
                      'إعادة المحاولة',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
