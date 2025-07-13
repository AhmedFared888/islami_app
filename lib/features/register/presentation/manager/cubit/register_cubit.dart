import 'package:bloc/bloc.dart';
import 'package:islami/features/register/domain/entites/user_entity.dart';
import 'package:islami/features/register/domain/params/register_params.dart';
import 'package:islami/features/register/domain/usecases/register_usecase.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase registerUsecase;

  RegisterCubit(this.registerUsecase) : super(RegisterInitial());

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());

    final result = await registerUsecase.execute(
      RegisterParams(email: email, password: password),
    );

    result.fold(
      (failure) => emit(RegisterFailure(errorMessage: failure.message)),
      (user) => emit(RegisterSuccess(userEntity: user)),
    );
  }
}
