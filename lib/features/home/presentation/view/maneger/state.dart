import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/data/model/azker_model.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/data/model/model.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/view/maneger/cubit.dart';
import 'package:fortress_of_the_muslim/features/home/presentation/view/maneger/state.dart';

class AdkarCubit extends Cubit<AdkarStates> {
  AdkarCubit() : super(AdkarInitial());

  static AdkarCubit get(context) => BlocProvider.of(context);

  List<Adker> _adkar = [];

  void fetchAdkar(String category) {
    emit(AdkarLoading());
    try {
      if (!adkarJson.containsKey(category)) {
        emit(AdkarError("الفئة غير موجودة: $category"));
        return;
      }

      final List<dynamic> adkarList = adkarJson[category]!;
      _adkar = adkarList.map((json) => Adker.fromJson(json)).toList();
      emit(AdkarLoaded(_adkar));
    } catch (e) {
      emit(AdkarError("حدث خطأ أثناء تحميل الأذكار: $e"));
    }
  }
}
