import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:expensetracker/core/theme/app_spacing.dart';
import 'package:expensetracker/features/wallets/data/wallet_model.dart';
import 'package:expensetracker/features/wallets/ui/wallet_model_display_x.dart';
import 'package:flutter/material.dart';

class WalletCardWidget extends StatelessWidget {
  const WalletCardWidget({
    super.key,
    required this.colors,

    required this.textTheme,
    required this.walletModel,
  });

  final AppColors colors;
  final WalletModel walletModel;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: colors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Color(walletModel.color ?? 0).withValues(alpha: 0.14),
              shape: BoxShape.circle,
            ),
            child: Icon(walletModel.iconData, size: 20, color: walletModel.displayColor),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(walletModel.name, style: textTheme.titleLarge),
                    if (walletModel.isDefault) ...[
                      const SizedBox(width: AppSpacing.xs),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xs,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: colors.accentSoft,
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                        ),
                        child: Text(
                          'Default',
                          style: textTheme.labelMedium?.copyWith(
                            color: colors.accent,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                Text(
                  walletModel.formattedBalance,
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          // TODO(logic): open edit-wallet flow for this wallet.
          IconButton(
            onPressed: null,
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
    );
  }
}
