import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/features/auth/login/domain/entities/user_entity.dart';
import 'package:islami/features/auth/login/domain/repos/login_repository.dart';

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
      final errorMessage = _mapFirebaseAuthError(e.code);
      return Left(Failure(errorMessage));
    }
  }

  String _mapFirebaseAuthError(String code) {
    switch (code) {
      case 'user-not-found':
        return 'هذا البريد الإلكتروني غير مسجل.';
      case 'wrong-password':
        return 'كلمة المرور غير صحيحة.';
      case 'invalid-email':
        return 'صيغة البريد الإلكتروني غير صحيحة.';
      case 'user-disabled':
        return 'تم تعطيل هذا الحساب.';
      case 'too-many-requests':
        return 'تم حظر المحاولات مؤقتاً. حاول لاحقًا.';
      case 'network-request-failed':
        return 'لا يوجد اتصال بالإنترنت.';
      default:
        return 'حدث خطأ أثناء تسجيل الدخول. حاول مرة أخرى.';
    }
  }
}
