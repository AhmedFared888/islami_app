part of 'fetch_azkar_cubit.dart';

@immutable
sealed class FetchAzkarState {}

final class FetchAzkarInitial extends FetchAzkarState {}

final class FetchAzkarLoading extends FetchAzkarState {}

final class FetchAzkarSuccess extends FetchAzkarState {
  final List<AzkarDetailsEntity> azkar;

  FetchAzkarSuccess(this.azkar);
}

final class FetchAzkarFailure extends FetchAzkarState {
  final String errorMessage;

  FetchAzkarFailure(this.errorMessage);
}
