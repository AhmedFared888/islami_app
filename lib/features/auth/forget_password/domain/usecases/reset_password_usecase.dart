import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/core/use_cases/use_case.dart';
import 'package:islami/features/auth/forget_password/domain/entities/user_entity.dart';
import 'package:islami/features/auth/forget_password/domain/params/reset_password_params.dart';
import 'package:islami/features/auth/forget_password/domain/repos/forget_password_repo.dart';

class ForgetPasswordUsecase extends UseCase<UserEntity, ResetPasswordParams> {
  final ForgetPasswordRepo forgetPasswordRepo;

  ForgetPasswordUsecase(this.forgetPasswordRepo);

  @override
  Future<Either<Failure, UserEntity>> execute(ResetPasswordParams params) {
    return forgetPasswordRepo.resetPassword(email: params.email);
  }
}
