import 'package:dartz/dartz.dart';
import 'package:fortress_of_the_muslim/core/utils/api_service_azaan.dart';
import 'package:fortress_of_the_muslim/core/utils/error/failure.dart';
import 'package:fortress_of_the_muslim/pray/data/Model/azzan_model/azzan_model.dart';

abstract class AzaanRepo {
  Future<Either<Failure, AzzanModel>> fetchDailyPrayerTimes(String city);
  Future<Either<Failure, List<AzzanModel>>> fetchWeeklyPrayerTimes(String city);
}
