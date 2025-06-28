import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';

abstract class UseCase<type, params> {
  Future<Either<Failure, type>> execute(params params);
}
