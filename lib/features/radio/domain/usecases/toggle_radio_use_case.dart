import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/use_cases/no_param_use_case.dart';
import 'package:islami/core/utils/api_service.dart';
import 'package:islami/features/radio/domain/entities/audio_state%20.dart';

class ToggleRadioUseCase extends UseCase<AudioState> {
  final AudioService _service;

  ToggleRadioUseCase(this._service);

  @override
  Future<Either<Failure, AudioState>> execute() async {
    try {
      final state = await _service.toggle();
      return right(state);
    } catch (e) {
      return left(ServerFailre(e.toString()));
    }
  }
}
