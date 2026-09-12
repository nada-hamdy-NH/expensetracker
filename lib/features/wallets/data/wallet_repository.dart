import 'package:expensetracker/core/utils/result.dart';
import 'package:expensetracker/features/wallets/data/wallet_model.dart';

abstract class WalletRepository {
  Future<Result<List<WalletModel>>> getWallets();
  Future<Result<void>> addWallet(WalletModel wallet);
  Future<Result<void>> updateWallet(WalletModel wallet);
  Future<Result<void>> deleteWallet(String walletId);
}