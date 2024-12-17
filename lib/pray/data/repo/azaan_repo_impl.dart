import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fortress_of_the_muslim/core/utils/api_service_azaan.dart';
import 'package:fortress_of_the_muslim/pray/data/azzan_model/azzan_model.dart';
import 'package:fortress_of_the_muslim/pray/data/repo/azaan_repo.dart';

import '../../../core/utils/error/failure.dart';

class AzaanRepoImpl implements AzaanRepo {
  final ApiServiceAzaan apiService;

  AzaanRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AzzanModel>> fetchDailyPrayerTimes() async {
    try {
      final data = await apiService.get();
      return Right(AzzanModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        final failure = ServiceFailure.fromDioError(e);

        print('Error: ${failure.errorMessage}');

        return Left(ServiceFailure.fromDioError(e));
      } else {
        print('Unexpected error: $e');
        return Left(ServiceFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<AzzanModel>>> fetchWeeklyPrayerTimes() async {
    try {
      final data = await apiService.get();
      if (data['items'] != null && data['items'].isNotEmpty) {
        final List<AzzanModel> models = data['items']
            .map<AzzanModel>((item) => AzzanModel.fromJson(item))
            .toList();
        return Right(models);
      } else {
        return Left(
            ServiceFailure('No weekly prayer times found for the city Cairo'));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServiceFailure.fromDioError(e));
      } else {
        return Left(ServiceFailure(e.toString()));
      }
    }
  }
}
