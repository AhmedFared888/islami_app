import 'package:dartz/dartz.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/features/forget_password/domain/entities/user_entity.dart';

abstract class ForgetPasswordRepo {
  Future<Either<Failure, UserEntity>> resetPassword({required String email});
}
