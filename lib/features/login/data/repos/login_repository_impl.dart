import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/features/login/domain/entities/user_entity.dart';
import 'package:islami/features/login/domain/repos/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final FirebaseAuth firebaseAuth;

  LoginRepositoryImpl(this.firebaseAuth);

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user!;
      return Right(UserEntity(uid: user.uid, email: user.email ?? ''));
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.message?.toString() ?? 'Login failed'));
    }
  }
}
