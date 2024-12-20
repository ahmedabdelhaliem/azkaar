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
        // الحاوية الخاصة بالصورة مع خلفية شفافة
        Container(
          color: Colors.teal.withOpacity(0.8), // خلفية شفافة بلون التوركوازي
          height: screenHeight * 0.25, // يجعل الحاوية تحتل ربع الشاشة
          width: screenWidth,
          alignment: Alignment.center, // لتوسيط الصورة داخل الحاوية
          child: Image.asset(
            Images.mosque,
            height: screenHeight * 0.30, // حجم الصورة نسبة إلى الشاشة
            width: screenWidth * 0.30,
          ),
        ),
        const WrapCustomCard(), // الكارد المخصص لعرض المحتوى

        // يتم تعليق هذا القسم لأنه كان جزءًا غير مكتمل، في حال الحاجة إليه يمكنك إلغاء تعليق السطور أدناه
        // Expanded(
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
