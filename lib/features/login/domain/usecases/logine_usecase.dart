import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';

import '../entities/user_entity.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, UserEntity>> execute({
    required String email,
    required String password,
  }) {
    return repository.login(email: email, password: password);
  }
}
