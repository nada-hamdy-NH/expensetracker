import 'package:expensetracker/core/utils/result.dart';
import 'package:expensetracker/features/wallets/data/wallet_model.dart';
import 'package:expensetracker/features/wallets/data/wallet_repository.dart';
import 'package:expensetracker/features/wallets/ui/logic/wallet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddWalletCubit extends Cubit<WalletState> {
  final WalletRepository _walletRepository;
  AddWalletCubit(this._walletRepository) : super(WalletState.initial());
   Future<void> addWallet({required WalletModel wallet}) async {
    emit(WalletState.loading());
    final result = await _walletRepository.addWallet( wallet);
    switch (result) {
      case  Success<void>():
        emit(WalletState.success());
        break;
      case (Error<void> error):
        emit(WalletState.failure(error.message));
        break;
    }
}
}