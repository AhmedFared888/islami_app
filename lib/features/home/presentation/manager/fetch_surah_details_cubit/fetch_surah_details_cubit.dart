import 'package:bloc/bloc.dart';
import 'package:islami/features/home/domain/entities/surah_details_entity.dart';
import 'package:islami/features/home/domain/usecases/surah_details_use_case.dart';
import 'package:meta/meta.dart';

part 'fetch_surah_details_state.dart';

class FetchSurahDetailsCubit extends Cubit<FetchSurahDetailsState> {
  FetchSurahDetailsCubit(this.surahDetailsUseCase)
    : super(FetchSurahDetailsInitial());

  final SurahDetailsUseCase surahDetailsUseCase;

  Future<void> fetchSurahDetails(int surahId) async {
    emit(FetchSurahDetailsLoading());
    var result = await surahDetailsUseCase.execute(surahId);
    result.fold(
      (failure) {
        emit(FetchSurahDetailsFailure(failure.message));
      },
      (surahDetails) {
        emit(FetchSurahDetailsSuccess(surahDetails));
      },
    );
  }
}
