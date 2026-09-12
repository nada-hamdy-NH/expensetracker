import 'package:expensetracker/features/wallets/data/wallet_model.dart';
import 'package:flutter/material.dart';

extension WalletModelDisplayX on WalletModel {

  IconData get iconData=> icon != null ?
   IconData( int.parse(icon!),
    fontFamily: 'MaterialIcons') : Icons.account_balance_wallet_outlined;
   
   
   
   Color get displayColor => color != null ? Color(color!) : const Color(0xFF0E6F58);
    String get formattedBalance => '$currency ${balance.toStringAsFixed(2)}';
   }