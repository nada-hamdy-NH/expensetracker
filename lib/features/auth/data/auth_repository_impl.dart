import 'package:expensetracker/core/utils/result.dart';
import 'package:expensetracker/features/auth/data/auth_api_service.dart';
import 'package:expensetracker/features/auth/domain/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl extends AuthRepository{
    AuthRepositoryImpl(this._authApiService);
    final AuthApiService _authApiService ; 
  
  @override
  Future<Result<void>> sendPasswordResetEmail({
    required String email}) async{
        try{
    await _authApiService.sendPasswordResetEmail(email: email);
    return Result.success(null);
        } on AuthException catch(e){
            return Result.error(e.message);
        }
    
  }

  @override
  Future<Result<void>> signInWithEmailAndPassword({required String email, required String password}) async{
   try{
   
   await _authApiService.signInWithEmailAndPassword(email: email, password: password);
 return Result.success(null);
   }
  on AuthException catch(e){
    return Result.error(e.message);
   }

  
  }

  @override
  Future<Result<void>> signOut()async {
    try{
    await _authApiService.signOut();
    return Result.success(null);
   }
  on AuthException catch(e){
    return Result.error(e.message);
   }
  }

  @override
  Future<Result<void>> signUpWithEmailAndPassword({
    required String email,
     required String password, 
     required String username}) async{
    try{
   
   await  _authApiService.signUpWithEmailAndPassword(email: email, password: password, username: username);
 return Result.success(null);
  }
  on AuthException catch(e){
    return Result.error(e.message);
   }
     }

  @override
Stream<bool> get authStateChanges {
  return _authApiService.onAuthStateChange.map(
    (state) => state.session != null,
  );
}

  @override
  bool get isLoggedIn => _authApiService.currentSession != null;


  

}