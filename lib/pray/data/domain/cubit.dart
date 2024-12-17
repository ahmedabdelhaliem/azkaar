import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortress_of_the_muslim/pray/data/repo/azaan_repo.dart';

import 'state_cubit.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  final AzaanRepo azaanRepo;
  PrayerTimesCubit(this.azaanRepo) : super(PrayerTimesInitial());

  Future<void> fetchPrayerTimes() async {
    var result = await azaanRepo.fetchDailyPrayerTimes();
    result.fold((failure) {
      emit(PrayerTimesError(failure.errorMessage));
    }, (time) {
      emit(PrayerTimesLoaded(time));
    });
  }
}
