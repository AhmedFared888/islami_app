import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';

import '../entities/user_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });
}
