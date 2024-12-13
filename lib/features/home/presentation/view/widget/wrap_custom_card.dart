import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/core/utils/assets.dart';
import 'package:fortress_of_the_muslim/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/view/widget/custom_card.dart';

class WrapCustomCard extends StatelessWidget {
  const WrapCustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          GestureDetector(
            onTap: () {
              // تمرير الفئة "أذكار الأنبياء"
              GoRouter.of(context).push(
                AppRouter.kPhresesView,
                extra: 'أدعية الأنبياء',
              );
            },
            child: const CustomCard(
              image: Images.papyrus,
              text: 'أدعية الأنبياء',
            ),
          ),
          GestureDetector(
            onTap: () {
              // تمرير الفئة "أذكار التسبيح"
              GoRouter.of(context).push(
                AppRouter.kPhresesView,
                extra: 'أذكار تسبيح',
              );
            },
            child: const CustomCard(
              image: Images.taspih,
              text: 'أذكار التسبيح',
            ),
          ),
          GestureDetector(
            onTap: () {
              // تمرير الفئة "أذكار النوم"
              GoRouter.of(context).push(
                AppRouter.kPhresesView,
                extra: 'أذكار النوم',
              );
            },
            child: const CustomCard(
              image: Images.moon,
              text: 'أذكار النوم',
            ),
          ),
          GestureDetector(
            onTap: () {
              // تمرير الفئة "أذكار الصباح"
              GoRouter.of(context).push(
                AppRouter.kPhresesView,
                extra: 'أذكار الصباح',
              );
            },
            child: const CustomCard(
              image: Images.sun,
              text: 'أذكار الصباح',
            ),
          ),
          GestureDetector(
            onTap: () {
              // تمرير الفئة "أذكار الاستيقاظ"
              GoRouter.of(context).push(
                AppRouter.kPhresesView,
                extra: 'أذكار الاستيقاظ',
              );
            },
            child: const CustomCard(
              image: Images.sunny,
              text: 'أذكار الاستيقاظ',
            ),
          ),
          GestureDetector(
            onTap: () {
              // تمرير الفئة "أذكار المساء"
              GoRouter.of(context).push(
                AppRouter.kPhresesView,
                extra: 'أذكار المساء',
              );
            },
            child: const CustomCard(
              image: Images.moon, // يمكنك تغيير الصورة حسب الرغبة
              text: 'أذكار المساء',
            ),
          ),
        ],
      ),
    );
  }
}
