import 'package:expensetracker/core/theme/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LivePreviewCardWidget extends StatelessWidget {
  const LivePreviewCardWidget({
    super.key,
    required this.previewColor,
    required this._iconIndex,
    required this._nameController,
    required this.textTheme,
    required this._currency,
    required this._balanceController,
    required this._walletIcons,

  });

  final Color previewColor;
  final int _iconIndex;
  final TextEditingController _nameController;
  final TextTheme textTheme;
  final String _currency;
  final TextEditingController _balanceController;
  final List<IconData> _walletIcons;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [previewColor, previewColor.withValues(alpha: 0.78)],
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _walletIcons[_iconIndex],
              color: Colors.white,
              size: 22,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _nameController.text.isEmpty
                      ? 'Wallet name'
                      : _nameController.text,
                  style: textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '$_currency ${_balanceController.text.isEmpty ? '0.00' : _balanceController.text}',
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
