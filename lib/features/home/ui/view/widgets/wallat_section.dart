import 'package:expensetracker/core/router/app_routes.dart';
import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:expensetracker/core/theme/app_spacing.dart';
import 'package:expensetracker/features/wallets/data/wallet_model.dart';
import 'package:expensetracker/features/wallets/ui/wallet_model_display_x.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WalletsSection extends StatelessWidget {
  const WalletsSection({super.key, required this.wallets});
final List<WalletModel> wallets  ;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: AppSpacing.lg),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Your Wallets', style: textTheme.titleLarge),
              TextButton(
                onPressed: () => context.push(AppRoutes.addWallet),
                child: const Text('+ Add'),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(right: AppSpacing.lg),
            itemCount: wallets.length,
            separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
            itemBuilder: (context, index) {
              final wallet = wallets[index];
              return InkWell(
                borderRadius: BorderRadius.circular(AppRadius.md),
                onTap: () => context.push(AppRoutes.allWallets),
                child: Container(
                width: 152,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: Border.all(color: colors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: wallet.displayColor.withValues(alpha: 0.14),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(wallet.iconData, size: 16, color: wallet.displayColor),
                    ),
                    const Spacer(),
                    Text(wallet.name, style: textTheme.bodyMedium),
                    Text(
                      wallet.formattedBalance,
                      style: textTheme.labelLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
