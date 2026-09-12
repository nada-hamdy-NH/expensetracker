import 'package:expensetracker/core/utils/result.dart';
import 'package:expensetracker/features/wallets/data/wallet_api_service.dart';
import 'package:expensetracker/features/wallets/data/wallet_model.dart';
import 'package:expensetracker/features/wallets/data/wallet_repository.dart';

class WalletRepositoryImp implements WalletRepository {
  final WalletApiService _walletApiService;
   WalletRepositoryImp(this._walletApiService);

  @override
  Future<Result<void>> addWallet(WalletModel wallet)async {
   try{
      await _walletApiService.createWallet(walletModel: wallet);
      return Result.success(null);
    }catch(e){
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<void>> deleteWallet(String walletId) {
    // TODO: implement deleteWallet
    throw UnimplementedError();
  }

  @override
  Future<Result<List<WalletModel>>> getWallets() async{
    try{
      final walletsData = await _walletApiService.getWallets();
      final wallets = walletsData.map((data) => WalletModel.fromJson(data)).toList();
      return Result.success(wallets);
    }catch(e){
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<void>> updateWallet(WalletModel wallet) {
    // TODO: implement updateWallet
    throw UnimplementedError();
  }
}