import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/use_cases/use_case.dart';
import 'package:islami/features/login/domain/params/login_params.dart';
import 'package:islami/features/login/domain/repos/auth_repository.dart';

import '../entities/user_entity.dart';

class LoginUseCase extends UseCase<UserEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> execute(LoginParams params) {
    return repository.login(email: params.email, password: params.password);
  }
}
