

import 'package:expensetracker/features/wallets/data/wallet_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_wallets_state.freezed.dart';
@freezed 
class GetWalletsState with _$GetWalletsState {
  const factory GetWalletsState.initial() = GetWalletsInitial;
  const factory GetWalletsState.loading() = GetWalletsLoading;
  const factory GetWalletsState.success(List<WalletModel> wallets) = GetWalletsSuccess;
  const factory GetWalletsState.failure(String message) = GetWalletsFailure;
}