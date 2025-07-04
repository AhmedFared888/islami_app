part of 'fetch_surah_details_cubit.dart';

@immutable
sealed class FetchSurahDetailsState {}

final class FetchSurahDetailsInitial extends FetchSurahDetailsState {}

final class FetchSurahDetailsLoading extends FetchSurahDetailsState {}

final class FetchSurahDetailsSuccess extends FetchSurahDetailsState {
  final SurahDetailsEntity surahDetails;

  FetchSurahDetailsSuccess(this.surahDetails);
}

final class FetchSurahDetailsFailure extends FetchSurahDetailsState {
  final String errorMessage;

  FetchSurahDetailsFailure(this.errorMessage);
}
