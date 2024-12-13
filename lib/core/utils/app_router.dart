import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/features/home/home_view.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/data/model/model.dart';
import 'package:fortress_of_the_muslim/features/phreses/phreses_view.dart';
import 'package:fortress_of_the_muslim/features/splash/widget/splash_view.dart';
import 'package:fortress_of_the_muslim/features/tasbeh/TasbeehCounterScreen.dart';
import 'package:fortress_of_the_muslim/features/tasbeh/tasbeh_view.dart';
import 'package:fortress_of_the_muslim/pray/pray_time_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetilsView = '/bookdetails';
  static const kPhresesView = '/PhresesView';
  static const kTasbeehCounterScreen = '/kTasbeehCounterScreen';
  static const kPrayerTimesScreen = '/PrayerTimesScreen';

  static final GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: kHomeView,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: kPhresesView,
      builder: (BuildContext context, GoRouterState state) {
        final category = state.extra as String; // تمرير الفئة كمعامل
        return PhresesView(category: category);
      },
    ),
    GoRoute(
      path: kTasbeehCounterScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const Tasbeehcounterscreen();
      },
    ),
    GoRoute(
      path: kPrayerTimesScreen,
      builder: (BuildContext context, GoRouterState state) {
        // الحصول على المدينة من extra
        final city = state.extra as String? ?? 'cairo';
        return PrayerTimesScreen(city: city);
      },
    ),
  ]);
}
