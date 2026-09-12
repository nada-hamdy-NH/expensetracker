import 'package:supabase_flutter/supabase_flutter.dart';

class AuthApiService {
  AuthApiService(this._client);
  final SupabaseClient _client  ; 
   Future<AuthResponse> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username }) async{
       return   _client.auth.signUp(
        email: email,
        password: password , 
        data: {'username': username}
        
        );
       
    }

     Future<AuthResponse> signInWithEmailAndPassword({
    required String email,
    required String password }) async{
       return   _client.auth.signInWithPassword(
        email: email,
        password: password , 
       
        
        );
       
    }

    Future<void> signOut() async{
       return   _client.auth.signOut();
    }



    Future<void> sendPasswordResetEmail({
    required String email }) async{
       return   _client.auth.resetPasswordForEmail(
      email,
       );
    }

Stream<AuthState> get onAuthStateChange => _client.auth.onAuthStateChange;

   Session? get currentSession => _client.auth.currentSession;


   
    
    } 