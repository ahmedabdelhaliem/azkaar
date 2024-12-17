import 'package:dartz/dartz.dart';
import 'package:fortress_of_the_muslim/core/utils/api_service_azaan.dart';
import 'package:fortress_of_the_muslim/core/utils/error/failure.dart';
import 'package:fortress_of_the_muslim/pray/data/azzan_model/azzan_model.dart';

abstract class AzaanRepo {
  Future<Either<Failure, AzzanModel>> fetchDailyPrayerTimes();
  Future<Either<Failure, List<AzzanModel>>> fetchWeeklyPrayerTimes();
}
