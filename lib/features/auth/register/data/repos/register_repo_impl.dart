import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:islami/core/errors/failure.dart';
import 'package:islami/features/auth/register/domain/entites/user_entity.dart';
import 'package:islami/features/auth/register/domain/repos/register_repo.dart';

class RegisterRepoImpl extends RegisterRepo {
  final FirebaseAuth firebaseAuth;

  RegisterRepoImpl(this.firebaseAuth);

  @override
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
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
      case 'email-already-in-use':
        return 'هذا البريد الإلكتروني مستخدم بالفعل.';
      case 'weak-password':
        return 'كلمة المرور ضعيفة. اختر كلمة أقوى.';
      case 'operation-not-allowed':
        return 'التسجيل بالبريد غير مفعل حالياً.';
      default:
        return 'حدث خطأ أثناء إنشاء الحساب. حاول مرة أخرى.';
    }
  }
}
