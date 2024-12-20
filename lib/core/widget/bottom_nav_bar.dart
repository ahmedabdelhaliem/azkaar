import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/core/utils/app_router.dart';
import 'package:fortress_of_the_muslim/core/utils/assets.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  // قائمة بالبيانات المتعلقة بكل وجهة
  final List<Map<String, String>> _destinations = [
    {'image': Images.quran, 'label': 'اذكار'},
    {'image': Images.taspih, 'label': 'تسبيح'},
    {'image': Images.mosque, 'label': 'مسجد'},
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: Colors.teal,
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        onItemSelected(index);
        _navigateToPage(context, index);
      },
      destinations: List.generate(
        _destinations.length,
        (index) {
          final destination = _destinations[index];
          return NavigationDestination(
            icon: _getIconForIndex(index, destination['image']!),
            label: destination['label']!,
            tooltip: destination['label'],
          );
        },
      ),
    );
  }

  // دالة لاختيار الأيقونة بناءً على الصفحة المحددة
  Widget _getIconForIndex(int index, String imagePath) {
    return Image.asset(
      imagePath,
      height: 30,
      width: 30,
      color: currentIndex == index ? null : Colors.grey,
    );
  }

  // دالة للتنقل بين الصفحات بناءً على الاختيار
  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        break;
      case 1:
        GoRouter.of(context).pushReplacement(AppRouter.kTasbeehCounterScreen);
        break;
      case 2:
        GoRouter.of(context).pushReplacement(AppRouter.kPrayerTimesScreen);
        break;
      default:
        break;
    }
  }
}
