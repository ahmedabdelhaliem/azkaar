import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/core/utils/assets.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/view/widget/custom_card.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/view/widget/wrap_custom_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          color: Colors.white.withOpacity(.8),
          height: screenHeight * 0.25, // يجعل الحاوية تحتل ربع الشاشة
          width: screenWidth,

          alignment: Alignment.center, // لتوسيط الصورة داخل الحاوية
          child: Image.asset(
            Images.splashRemove,
            height: screenHeight * 0.40, // حجم الصورة نسبة إلى الشاشة
            width: screenWidth * 0.40,
          ),
        ),
        const WrapCustomCard(),
        // Expanded(ش
        //   child: Container(
        //     color: Colors.white, // لون الخلفية لباقي الشاشة
        //     child: const Center(
        //       child: Text(
        //         'محتوى الصفحة هنا',
        //         style: TextStyle(fontSize: 18, color: Colors.black),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
