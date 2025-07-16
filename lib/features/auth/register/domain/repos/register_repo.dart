import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/features/auth/register/domain/entites/user_entity.dart';

abstract class RegisterRepo {
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
  });
}
