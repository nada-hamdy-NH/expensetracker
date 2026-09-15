import 'package:bloc_test/bloc_test.dart';
import 'package:expensetracker/core/utils/result.dart';
import 'package:expensetracker/features/wallets/data/wallet_model.dart';
import 'package:expensetracker/features/wallets/data/wallet_repository.dart';
import 'package:expensetracker/features/wallets/ui/logic/wallet_cubit.dart';
import 'package:expensetracker/features/wallets/ui/logic/wallet_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWalletRepository extends Mock implements WalletRepository {}

void main() {
  late MockWalletRepository walletRepository;

  setUpAll(() {
    registerFallbackValue(
      const WalletModel(
        name: 'fallback',
        balance: 0,
        currency: 'EGP',
        isDefault: false,
      ),
    );
  });

  setUp(() {
    walletRepository = MockWalletRepository();
  });

  group('AddWalletCubit', () {
    final wallet = const WalletModel(
      name: 'Cash',
      balance: 500,
      currency: 'EGP',
      isDefault: true,
    );

    blocTest<AddWalletCubit, WalletState>(
      'emits [loading, success] when the wallet is added',
      setUp: () {
        when(() => walletRepository.addWallet(wallet))
            .thenAnswer((_) async => Result.success(null));
      },
      build: () => AddWalletCubit(walletRepository),
      act: (cubit) => cubit.addWallet(wallet: wallet),
      expect: () => [
        WalletState.loading(),
        WalletState.success(),
      ],
    );

    blocTest<AddWalletCubit, WalletState>(
      'emits [loading, failure] when adding the wallet fails',
      setUp: () {
        when(() => walletRepository.addWallet(wallet))
            .thenAnswer((_) async => Result.error('Could not save wallet'));
      },
      build: () => AddWalletCubit(walletRepository),
      act: (cubit) => cubit.addWallet(wallet: wallet),
      expect: () => [
        WalletState.loading(),
        WalletState.failure('Could not save wallet'),
      ],
    );
  });
}
