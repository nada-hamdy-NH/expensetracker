import 'package:bloc_test/bloc_test.dart';
import 'package:expensetracker/core/utils/result.dart';
import 'package:expensetracker/features/wallets/data/wallet_model.dart';
import 'package:expensetracker/features/wallets/data/wallet_repository.dart';
import 'package:expensetracker/features/wallets/ui/logic/get_wallets_cubit.dart';
import 'package:expensetracker/features/wallets/ui/logic/get_wallets_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWalletRepository extends Mock implements WalletRepository {}

void main() {
  late MockWalletRepository walletRepository;

  setUp(() {
    walletRepository = MockWalletRepository();
  });

  group('GetWalletsCubit', () {
    final wallets = [
      const WalletModel(
        id: '1',
        name: 'Cash',
        balance: 500,
        currency: 'EGP',
        isDefault: true,
      ),
      const WalletModel(
        id: '2',
        name: 'Bank',
        balance: 1200,
        currency: 'EGP',
        isDefault: false,
      ),
    ];

    blocTest<GetWalletsCubit, GetWalletsState>(
      'emits [loading, success(wallets)] when wallets are fetched',
      setUp: () {
        when(() => walletRepository.getWallets())
            .thenAnswer((_) async => Result.success(wallets));
      },
      build: () => GetWalletsCubit(walletRepository),
      act: (cubit) => cubit.getWallets(),
      expect: () => [
        const GetWalletsState.loading(),
        GetWalletsState.success(wallets),
      ],
    );

    blocTest<GetWalletsCubit, GetWalletsState>(
      'emits [loading, failure] when fetching wallets fails',
      setUp: () {
        when(() => walletRepository.getWallets())
            .thenAnswer((_) async => Result.error('Network error'));
      },
      build: () => GetWalletsCubit(walletRepository),
      act: (cubit) => cubit.getWallets(),
      expect: () => const [
        GetWalletsState.loading(),
        GetWalletsState.failure('Network error'),
      ],
    );
  });
}
