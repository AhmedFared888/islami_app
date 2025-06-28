import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';

abstract class UseCase<type> {
  Future<Either<Failure, type>> execute();
}
