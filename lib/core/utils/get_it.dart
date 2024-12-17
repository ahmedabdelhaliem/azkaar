import 'package:dio/dio.dart';
import 'package:fortress_of_the_muslim/core/utils/api_service_azaan.dart';
import 'package:fortress_of_the_muslim/pray/data/repo/azaan_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiServiceAzaan>(ApiServiceAzaan(Dio()));
  getIt.registerSingleton<AzaanRepoImpl>(
      AzaanRepoImpl(getIt.get<ApiServiceAzaan>()));
  // getIt.registerSingleton<ItemsCubit>(ItemsCubit(getIt<ApiService>()));
}
