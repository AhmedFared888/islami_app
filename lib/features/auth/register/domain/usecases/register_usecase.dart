import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/use_cases/use_case.dart';
import 'package:islami/features/auth/register/domain/entites/user_entity.dart';
import 'package:islami/features/auth/register/domain/params/register_params.dart';
import 'package:islami/features/auth/register/domain/repos/register_repo.dart';

class RegisterUsecase extends UseCase<UserEntity, RegisterParams> {
  final RegisterRepo registerRepo;

  RegisterUsecase(this.registerRepo);

  @override
  Future<Either<Failure, UserEntity>> execute(RegisterParams params) {
    return registerRepo.register(
      email: params.email,
      password: params.password,
    );
  }
}
