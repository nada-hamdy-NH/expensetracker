import 'package:expensetracker/features/wallets/data/wallet_model.dart';
import 'package:expensetracker/features/wallets/ui/logic/wallet_cubit.dart';
import 'package:expensetracker/features/wallets/ui/logic/wallet_state.dart';
import 'package:expensetracker/features/wallets/ui/widgets/color_swatch_tile.dart';
import 'package:expensetracker/features/wallets/ui/widgets/icon_option_tile.dart';
import 'package:expensetracker/features/wallets/ui/widgets/live_preview_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/ui/app_primary_button.dart';
import '../../../../core/ui/app_text_field.dart';
import '../../../../core/ui/selectable_chip.dart';

const _walletIcons = [
  Icons.account_balance_wallet_outlined,
  Icons.payments_outlined,
  Icons.credit_card_rounded,
  Icons.savings_outlined,
  Icons.account_balance_outlined,
  Icons.attach_money_rounded,
];

const _walletColors = [
  Color(0xFF0E6F58),
  Color(0xFFFF7A50),
  Color(0xFF3D6DF2),
  Color(0xFFB8862E),
  Color(0xFF8A5CF6),
  Color(0xFFD64545),
];

const _currencies = ['EGP', 'USD', 'SAR'];

/// Static form UI — name/balance/currency/icon/color are all local UI
/// state. Creating the wallet row in Supabase is logic-layer work; the
/// Save button is intentionally disabled until then.
class AddWalletView extends StatefulWidget {
  const AddWalletView({super.key});

  @override
  State<AddWalletView> createState() => _AddWalletViewState();
}

class _AddWalletViewState extends State<AddWalletView> {
  final _nameController = TextEditingController();
  final _balanceController = TextEditingController();
  String _currency = _currencies.first;
  int _iconIndex = 0;
  int _colorIndex = 0;
  bool _isDefault = false;

  @override
  void dispose() {
    _nameController.dispose();
    _balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    final previewColor = _walletColors[_colorIndex];

    return BlocConsumer<AddWalletCubit, WalletState>(
      listener: (context, state) {
        if (state case WalletFailure(:final message)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        }
        if (state case WalletSuccess()) {
          final messenger = ScaffoldMessenger.of(context);
          context.pop();
          messenger.showSnackBar(
            const SnackBar(content: Text('Wallet added successfully!')),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is WalletLoading;

        return Scaffold(
        appBar: AppBar(
          title: const Text('Add Wallet'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.sm,
              AppSpacing.lg,
              AppSpacing.lg,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Live preview card.
                LivePreviewCardWidget(previewColor: previewColor, iconIndex: _iconIndex, nameController: _nameController, textTheme: textTheme, currency: _currency, balanceController: _balanceController, walletIcons: _walletIcons,),
                const SizedBox(height: AppSpacing.xl),
      
                AppTextField(
                  label: 'Wallet Name',
                  hint: 'e.g. Cash, Bank Card',
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                  prefixIcon: Icons.badge_outlined,
                  validator: (value) => (value == null || value.trim().isEmpty)
                      ? 'Enter a wallet name'
                      : null,
                ),
                const SizedBox(height: AppSpacing.md),
                AppTextField(
                  label: 'Initial Balance',
                  hint: '0.00',
                  controller: _balanceController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.done,
                  prefixIcon: Icons.payments_outlined,
                ),
                const SizedBox(height: AppSpacing.xl),
      
                Text('Currency', style: textTheme.labelMedium),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: AppSpacing.sm,
                  children: _currencies
                      .map(
                        (c) => SelectableChip(
                          label: c,
                          selected: _currency == c,
                          onTap: () => setState(() => _currency = c),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: AppSpacing.xl),
      
                Text('Icon', style: textTheme.labelMedium),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: List.generate(_walletIcons.length, (index) {
                   
                    return Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.sm),
                      child: 
                      IconOptionTile(
        icon: _walletIcons[index],
        selected: index == _iconIndex,
        selectedColor: previewColor,
        onTap: () => setState(() => _iconIndex = index),
      )
      
                      
                     
                    );
                  }),
                ),
                const SizedBox(height: AppSpacing.xl),
      
                Text('Color', style: textTheme.labelMedium),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: List.generate(_walletColors.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.sm),
                      child: ColorSwatchTile(
        color: _walletColors[index],
        selected: index == _colorIndex,
        borderColor: colors.border,
        onTap: () => setState(() => _colorIndex = index),
      )
      
                    );
                  }),
                ),
                const SizedBox(height: AppSpacing.xl),
      
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    color: colors.surfaceAlt,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Set as default wallet', style: textTheme.bodyLarge),
                      ),
                      Switch(
                        value: _isDefault,
                        onChanged: (value) => setState(() => _isDefault = value),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
      
                AppPrimaryButton(
                  label: 'Save Wallet',
                  loading: isLoading,
                  onPressed: isLoading
                      ? null
                      : () {
                          final wallet = WalletModel(
                            name: _nameController.text,
                            balance: double.tryParse(_balanceController.text) ?? 0,
                            currency: _currency,
                            icon: _walletIcons[_iconIndex].codePoint.toString(),
                            color: _walletColors[_colorIndex].toARGB32(),
                            isDefault: _isDefault,
                          );
                          context.read<AddWalletCubit>().addWallet(wallet: wallet);
                        },
                ),
              ],
            ),
          ),
        ),
        );
      },
    );
  }
}

