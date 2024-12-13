import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/core/utils/app_router.dart';
import 'package:fortress_of_the_muslim/core/utils/assets.dart';
import 'package:fortress_of_the_muslim/features/home/home_view.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // الانتقال إلى الصفحة التالية بعد 3 ثوانٍ
    Future.delayed(const Duration(seconds: 3), () {
      context.go(AppRouter.kHomeView);
      // التنقل باستخدام go_router
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.splash),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
