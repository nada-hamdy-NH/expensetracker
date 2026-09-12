import 'package:expensetracker/core/utils/result.dart';
import 'package:expensetracker/features/auth/data/profile_api%20_service.dart';
import 'package:expensetracker/features/auth/domain/profile_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepositoryImpl extends ProfileRepository{
  ProfileRepositoryImpl(this._profileApiService);
  final ProfileApiService _profileApiService;
  @override
  Future<Result<void>> updateProfile({required String currency, required String language}) async{
    try{
      await _profileApiService.updateProfile(currency: currency, language: language);
      return Result.success(null);
    } on AuthException catch(e){
      return Result.error(e.message);
    }
  }

  @override
  Future<Result<bool>> getOnboardingStatus() async{
    try{
      final response = await _profileApiService.getOnboardingStatus();
      return Result.success(response.first['onboarding_completed'] == true);
    } on AuthException catch (e) {
      debugPrint(e.runtimeType .toString());
  return Result.error(e.message);
  
} on PostgrestException catch (e) {
  debugPrint(e.runtimeType .toString());
  return Result.error(e.message);
}


  }
   
  
}