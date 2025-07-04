import 'package:bloc/bloc.dart';
import 'package:islami/features/home/domain/entities/surah_entity.dart';
import 'package:islami/features/home/domain/usecases/home_use_case.dart';
import 'package:meta/meta.dart';

part 'fetch_surahs_state.dart';

class FetchSurahsCubit extends Cubit<FetchSurahsState> {
  FetchSurahsCubit(this.homeUseCase) : super(FetchSurahsInitial());

  final HomeUseCase homeUseCase;

  Future<void> fetshSurahs() async {
    emit(FetchSurahsLoading());
    var result = await homeUseCase.execute();
    result.fold(
      (failure) {
        emit(FetchSurahsFailure(failure.message));
      },
      (surahs) {
        emit(FetchSurahsSuccess(surahs));
      },
    );
  }
}
