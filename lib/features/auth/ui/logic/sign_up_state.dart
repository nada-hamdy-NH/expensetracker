import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';
@freezed
sealed class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = SignUpInitial;
  const factory SignUpState.loading() = SignUpLoading;
  const factory SignUpState.success() = SignUpSuccess;
  const factory SignUpState.failure(String message) = SignUpFailure;
}