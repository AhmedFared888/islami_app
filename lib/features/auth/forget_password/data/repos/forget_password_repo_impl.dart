import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/features/auth/forget_password/domain/entities/user_entity.dart';
import 'package:islami/features/auth/forget_password/domain/repos/forget_password_repo.dart';

class ForgetPasswordRepoImpl extends ForgetPasswordRepo {
  final FirebaseAuth firebaseAuth;

  ForgetPasswordRepoImpl(this.firebaseAuth);

  @override
  Future<Either<Failure, UserEntity>> resetPassword({
    required String email,
  }) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return right(UserEntity(uid: '', email: email));
    } on FirebaseAuthException catch (e) {
      print('Firebase Error Code: ${e.code}');
      return left(Failure(_mapFirebaseAuthError(e.code)));
    } catch (e) {
      return Left(Failure('حدث خطأ غير متوقع'));
    }
  }

  String _mapFirebaseAuthError(String code) {
    switch (code) {
      case 'invalid-email':
        return 'صيغة البريد الإلكتروني غير صحيحة.';
      case 'user-not-found':
        return 'لا يوجد حساب بهذا البريد الإلكتروني.';
      case 'network-request-failed':
        return 'لا يوجد اتصال بالإنترنت.';
      default:
        return 'حدث خطأ أثناء إرسال رابط إعادة التعيين.';
    }
  }
}
