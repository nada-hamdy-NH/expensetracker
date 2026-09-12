
import 'package:expensetracker/core/utils/result.dart';
import 'package:expensetracker/features/auth/domain/profile_repository.dart';
import 'package:expensetracker/features/auth/ui/logic/complete_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit(this._profileRepository) : super(CompleteProfileState.initial());

  final ProfileRepository _profileRepository;
  
  
  Future<void> completeProfile({required String currency, required String language}
  ) async {
    emit(CompleteProfileState.loading());
    final result = await _profileRepository.updateProfile(currency: currency, language: language);
    switch( result) {
      case Success<void>():
        emit(CompleteProfileState.success());
        break;
      case (Error<void> error):
        emit(CompleteProfileState.failure(error.message));
        break;
    }
  }}