import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/features/login/domain/entities/user_entity.dart';
import 'package:islami/features/login/domain/params/login_params.dart';
import 'package:islami/features/login/domain/usecases/login_usecase.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    final result = await loginUseCase.execute(
      LoginParams(email: email, password: password),
    );

    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.message)),
      (user) => emit(LoginSuccess(user: user)),
    );
  }
}
