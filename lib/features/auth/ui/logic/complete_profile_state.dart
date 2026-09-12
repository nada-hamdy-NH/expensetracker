
import 'package:freezed_annotation/freezed_annotation.dart';

part  'complete_profile_state.freezed.dart';

@freezed 
sealed class CompleteProfileState with _$CompleteProfileState {
const factory CompleteProfileState.initial() = CompleteProfileInitial;
const factory CompleteProfileState.loading() = CompleteProfileLoading;
const factory CompleteProfileState.success() = CompleteProfileSuccess;
const factory CompleteProfileState.failure(String message) = CompleteProfileFailure;}