import 'package:bloc_test/bloc_test.dart';
import 'package:expensetracker/core/utils/result.dart';
import 'package:expensetracker/features/auth/domain/auth_repository.dart';
import 'package:expensetracker/features/auth/ui/logic/login_cubit.dart';
import 'package:expensetracker/features/auth/ui/logic/login_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
  });

  group('LoginCubit', () {
    const email = 'nada@example.com';
    const password = 'super-secret';

    blocTest<LoginCubit, LoginState>(
      'emits [loading, success] when sign-in succeeds',
      setUp: () {
        when(
          () => authRepository.signInWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).thenAnswer((_) async => Result.success(null));
      },
      build: () => LoginCubit(authRepository),
      act: (cubit) => cubit.loginWithEmailAndPassword(
        email: email,
        password: password,
      ),
      expect: () => const [
        LoginState.loading(),
        LoginState.success(),
      ],
    );

    blocTest<LoginCubit, LoginState>(
      'emits [loading, failure] when sign-in fails',
      setUp: () {
        when(
          () => authRepository.signInWithEmailAndPassword(
            email: email,
            password: password,
          ),
        ).thenAnswer((_) async => Result.error('Invalid credentials'));
      },
      build: () => LoginCubit(authRepository),
      act: (cubit) => cubit.loginWithEmailAndPassword(
        email: email,
        password: password,
      ),
      expect: () => const [
        LoginState.loading(),
        LoginState.failure('Invalid credentials'),
      ],
    );
  });
}
