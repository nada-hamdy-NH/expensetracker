

import 'package:expensetracker/features/wallets/data/wallet_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'wallet_state.freezed.dart';
@freezed 
class WalletState with _$WalletState {
  const factory WalletState.initial() = WalletInitial;
  const factory WalletState.loading() = WalletLoading;
  const factory WalletState.success() = WalletSuccess;
  const factory WalletState.failure(String message) = WalletFailure;
}