import 'package:bloc/bloc.dart';
import 'package:islami/features/home/domain/entities/surah_entity.dart';
import 'package:meta/meta.dart';

part 'fetch_surahs_state.dart';

class FetchSurahsCubit extends Cubit<FetchSurahsState> {
  FetchSurahsCubit() : super(FetchSurahsInitial());
}
