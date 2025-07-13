import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/use_cases/no_param_use_case.dart';
import 'package:islami/core/utils/api_service.dart';

class ToggleRadioUseCase extends UseCase<void> {
  final AudioService _service;

  ToggleRadioUseCase(this._service);

  @override
  Future<Either<Failure, void>> execute() async {
    try {
      await _service.toggle();
      return right(null);
    } catch (e) {
      return left(ServerFailre(e.toString()));
    }
  }
}
