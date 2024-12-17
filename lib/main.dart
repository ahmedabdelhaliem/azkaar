import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortress_of_the_muslim/core/notifications/local_notification_service.dart';
import 'package:fortress_of_the_muslim/core/notifications/work_manager_serviece.dart';
import 'package:fortress_of_the_muslim/core/utils/app_router.dart';
import 'package:fortress_of_the_muslim/core/utils/get_it.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/view/maneger/state.dart';
import 'package:fortress_of_the_muslim/pray/data/domain/cubit.dart';
import 'package:fortress_of_the_muslim/pray/data/repo/azaan_repo_impl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

  // تهيئة الإشعارات
  // await LocalNotificationService.init();
  await Future.wait([
    LocalNotificationService.init(),
    // WorkManagerService().init(),
  ]);

  setup();

  // إعداد GetIt

  // تحديد أوقات الصلاة والإشعارات
  // await LocalNotificationService.scheduleAllPrayerNotifications('Cairo');

  runApp(const FortressOftheMuslim());
}

class FortressOftheMuslim extends StatelessWidget {
  const FortressOftheMuslim({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AdkarCubit(),
        ),
        BlocProvider(
          create: (context) => PrayerTimesCubit(
            getIt.get<AzaanRepoImpl>(),
          )..fetchPrayerTimes(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
