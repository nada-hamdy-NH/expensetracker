import 'package:expensetracker/core/utils/result.dart';
import 'package:expensetracker/features/auth/domain/auth_repository.dart';
import 'package:expensetracker/features/auth/ui/logic/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository _authRepository;

  SignUpCubit(this._authRepository) : super(const SignUpState.initial());

  Future<void> signUpWithEmailAndPassword(String email, String password, String username) async {
    emit(const SignUpState.loading());
  
   final  result = await _authRepository.signUpWithEmailAndPassword(
     
      email: email,
      password: password,
      username: username

   );
    switch ( result ) {
      case Success<void>():
        emit(const SignUpState.success());
        break;
      case Error<void>():
        emit(SignUpState.failure(result.message.toString()));
        break;
    }
  }
}
      