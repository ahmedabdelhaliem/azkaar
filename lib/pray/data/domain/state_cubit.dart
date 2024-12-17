import 'package:fortress_of_the_muslim/pray/data/azzan_model/azzan_model.dart';

abstract class PrayerTimesState {}

class PrayerTimesInitial extends PrayerTimesState {}

class PrayerTimesLoading extends PrayerTimesState {}

class PrayerTimesLoaded extends PrayerTimesState {
  final AzzanModel prayerTimes;
  PrayerTimesLoaded(this.prayerTimes);
}

class PrayerTimesError extends PrayerTimesState {
  final String error;
  PrayerTimesError(this.error);
}
