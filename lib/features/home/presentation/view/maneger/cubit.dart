import 'package:fortress_of_the_muslim/features/home/presentation/data/model/azker_model.dart';

// حالات Cubit
abstract class AdkarStates {}

class AdkarInitial extends AdkarStates {}

class AdkarLoading extends AdkarStates {}

class AdkarLoaded extends AdkarStates {
  final List<Adker> adkar;
  AdkarLoaded(this.adkar);
}

class AdkarError extends AdkarStates {
  final String error;
  AdkarError(this.error);
}
