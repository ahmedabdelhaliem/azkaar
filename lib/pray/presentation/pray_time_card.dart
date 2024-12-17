import 'package:flutter/material.dart';

class PrayerTimeCard extends StatelessWidget {
  final String title;
  final String time;
  final IconData icon;
  final Color color;
  final bool isNotificationEnabled;
  final ValueChanged<bool> onNotificationToggle;

  const PrayerTimeCard({
    super.key,
    required this.title,
    required this.time,
    required this.icon,
    required this.color,
    required this.isNotificationEnabled,
    required this.onNotificationToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          time,
          style: const TextStyle(fontSize: 16),
        ),
        trailing: Switch(
          value: isNotificationEnabled,
          onChanged: onNotificationToggle,
        ),
      ),
    );
  }
}
