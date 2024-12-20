import 'package:flutter/material.dart';

// Widget لعرض العداد الحالي
class CounterDisplay extends StatelessWidget {
  final int counter;
  const CounterDisplay({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 90,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 80,
        backgroundColor: Colors.teal,
        child: Text(
          '$counter',
          style: const TextStyle(
            fontSize: 50,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Widget لزر زيادة العداد
class IncrementButton extends StatelessWidget {
  final VoidCallback onPressed;
  const IncrementButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
    );
  }
}

// Widget لزر إعادة التعيين
class ResetButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ResetButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.refresh, color: Colors.red),
      label: const Text(
        "إعادة التعيين",
        style: TextStyle(fontSize: 18, color: Colors.red),
      ),
    );
  }
}

// Widget لعرض الإجمالي اليومي
class TotalCountDisplay extends StatelessWidget {
  final int totalCount;
  const TotalCountDisplay({super.key, required this.totalCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          "$totalCount",
          style: const TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// Widget لزر مسح السجل
class ClearRecordButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ClearRecordButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.delete, color: Colors.red),
      label: const Text(
        "مسح السجل",
        style: TextStyle(fontSize: 18, color: Colors.red),
      ),
    );
  }
}
