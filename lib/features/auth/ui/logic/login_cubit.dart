import 'package:expensetracker/core/utils/result.dart';
import 'package:expensetracker/features/auth/domain/auth_repository.dart';
import 'package:expensetracker/features/auth/ui/logic/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository) : super(const LoginState.initial());
  final AuthRepository _authRepository  ; 

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(const LoginState.loading());
    final result = await _authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
      switch ( result) {
        case Success<void>():
          emit(const LoginState.success());
          break;
        case Error<void>():
          emit(LoginState.failure(result.message.toString()));
          break;
      }
      
}}