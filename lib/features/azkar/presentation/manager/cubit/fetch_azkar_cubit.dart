import 'package:bloc/bloc.dart';
import 'package:islami/features/azkar/domain/entities/azkar_details_entity.dart';
import 'package:islami/features/azkar/domain/usecases/azkar_details_use_case.dart';
import 'package:meta/meta.dart';

part 'fetch_azkar_state.dart';

class FetchAzkarCubit extends Cubit<FetchAzkarState> {
  FetchAzkarCubit(this.azkarDetailsUseCase) : super(FetchAzkarInitial());

  final AzkarDetailsUseCase azkarDetailsUseCase;

  Future<void> fetshAzkar(String category) async {
    emit(FetchAzkarLoading());
    var result = await azkarDetailsUseCase.execute(category);
    result.fold(
      (failure) {
        emit(FetchAzkarFailure(failure.message));
      },
      (azkar) {
        emit(FetchAzkarSuccess(azkar));
      },
    );
  }
}
