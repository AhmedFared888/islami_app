import 'package:bloc/bloc.dart';
import 'package:islami/features/auth/forget_password/domain/params/reset_password_params.dart';
import 'package:islami/features/auth/forget_password/domain/usecases/reset_password_usecase.dart';
import 'package:meta/meta.dart';

part 'forgetpassword_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUsecase forgetPasswordUsecase;

  ForgetPasswordCubit(this.forgetPasswordUsecase)
    : super(ForgetPasswordInitial());

  Future<void> resetPassword({required String email}) async {
    emit(ForgetPasswordLoading());

    final result = await forgetPasswordUsecase.execute(
      ResetPasswordParams(email: email),
    );

    result.fold(
      (failure) => emit(ForgetPasswordFailure(errorMessage: failure.message)),
      (_) => emit(ForgetPasswordSuccess(email: email)),
    );
  }
}
