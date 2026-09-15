import 'package:bloc_test/bloc_test.dart';
import 'package:expensetracker/core/utils/result.dart';
import 'package:expensetracker/features/auth/domain/auth_repository.dart';
import 'package:expensetracker/features/auth/ui/logic/sign_up_cubit.dart';
import 'package:expensetracker/features/auth/ui/logic/sign_up_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
  });

  group('SignUpCubit', () {
    const email = 'nada@example.com';
    const password = 'super-secret';
    const username = 'nada';

    blocTest<SignUpCubit, SignUpState>(
      'emits [loading, success] when sign-up succeeds',
      setUp: () {
        when(
          () => authRepository.signUpWithEmailAndPassword(
            email: email,
            password: password,
            username: username,
          ),
        ).thenAnswer((_) async => Result.success(null));
      },
      build: () => SignUpCubit(authRepository),
      act: (cubit) => cubit.signUpWithEmailAndPassword(email, password, username),
      expect: () => const [
        SignUpState.loading(),
        SignUpState.success(),
      ],
    );

    blocTest<SignUpCubit, SignUpState>(
      'emits [loading, failure] when the email is already registered',
      setUp: () {
        when(
          () => authRepository.signUpWithEmailAndPassword(
            email: email,
            password: password,
            username: username,
          ),
        ).thenAnswer((_) async => Result.error('Email already in use'));
      },
      build: () => SignUpCubit(authRepository),
      act: (cubit) => cubit.signUpWithEmailAndPassword(email, password, username),
      expect: () => const [
        SignUpState.loading(),
        SignUpState.failure('Email already in use'),
      ],
    );
  });
}
