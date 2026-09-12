import 'package:expensetracker/features/wallets/data/wallet_model.dart';
import 'package:expensetracker/features/wallets/ui/widgets/wallet_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';



/// Static list UI — every wallet below is placeholder data. The logic
/// layer swaps this for the signed-in user's real wallets (a Cubit
/// fetching from WalletRepository) without changing this layout.
class AllWalletsView extends StatelessWidget {
  final List<WalletModel> wallets  ;
  const AllWalletsView({super.key, required this.wallets});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Wallets'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(AppSpacing.lg),
          itemCount: wallets.length,
          separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
          itemBuilder: (context, index) {
            final wallet = wallets[index];
            return WalletCardWidget(
              colors: colors,
               textTheme: textTheme, walletModel: wallet,);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(AppRoutes.addWallet),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add Wallet'),
      ),
    );
  }
}

