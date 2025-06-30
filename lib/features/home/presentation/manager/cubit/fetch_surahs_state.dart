part of 'fetch_surahs_cubit.dart';

@immutable
sealed class FetchSurahsState {}

final class FetchSurahsInitial extends FetchSurahsState {}

final class FetchSurahsLoading extends FetchSurahsState {}

final class FetchSurahsSuccesse extends FetchSurahsState {
  final List<SurahEntity> surahs;

  FetchSurahsSuccesse(this.surahs);
}

final class FetchSurahsFailure extends FetchSurahsState {
  final String errorMessage;

  FetchSurahsFailure(this.errorMessage);
}
