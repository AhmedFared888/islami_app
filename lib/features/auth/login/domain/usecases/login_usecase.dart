import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/use_cases/use_case.dart';
import 'package:islami/features/auth/login/domain/params/login_params.dart';
import 'package:islami/features/auth/login/domain/repos/login_repository.dart';

import '../entities/user_entity.dart';

class LoginUseCase extends UseCase<UserEntity, LoginParams> {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> execute(LoginParams params) {
    return repository.login(email: params.email, password: params.password);
  }
}
