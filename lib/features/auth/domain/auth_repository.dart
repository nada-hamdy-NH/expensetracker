import 'package:expensetracker/core/utils/result.dart';

abstract class AuthRepository {
  Future<Result<void>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
Future<Result<void>>signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username
  });
  Future<Result<void>> signOut();
  Future<Result<void>> sendPasswordResetEmail({
    required String email
    });
Stream<bool> get authStateChanges;
bool get isLoggedIn;



}