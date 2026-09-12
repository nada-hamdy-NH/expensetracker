import 'package:expensetracker/core/utils/result.dart';
import 'package:expensetracker/features/wallets/data/wallet_model.dart';
import 'package:expensetracker/features/wallets/data/wallet_repository.dart';
import 'package:expensetracker/features/wallets/ui/logic/get_wallets_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetWalletsCubit extends Cubit<GetWalletsState> {
   final WalletRepository _walletRepository;
   GetWalletsCubit(this._walletRepository) : super(const GetWalletsState.initial());
 
   Future<void> getWallets() async {
     emit(const GetWalletsState.loading());
     final result = await _walletRepository.getWallets();
      switch (result) {
        case Success<List<WalletModel>>():
          emit(GetWalletsState.success(result.data));
          break;
        case (Error<List<WalletModel>> error):
          emit(GetWalletsState.failure(error.message));
          break;
      }
   }
 }