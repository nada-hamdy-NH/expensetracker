import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/ui/app_primary_button.dart';
import '../../../../core/ui/app_text_field.dart';

class _Category {
  const _Category(this.label, this.icon);
  final String label;
  final IconData icon;
}

const _expenseCategories = [
  _Category('Food', Icons.restaurant_outlined),
  _Category('Transport', Icons.directions_car_filled_outlined),
  _Category('Shopping', Icons.shopping_bag_outlined),
  _Category('Bills', Icons.receipt_long_outlined),
  _Category('Health', Icons.local_hospital_outlined),
  _Category('Fun', Icons.movie_outlined),
  _Category('Education', Icons.school_outlined),
  _Category('Other', Icons.more_horiz_rounded),
];

const _incomeCategories = [
  _Category('Salary', Icons.work_outline_rounded),
  _Category('Freelance', Icons.laptop_mac_outlined),
  _Category('Gift', Icons.card_giftcard_outlined),
  _Category('Other', Icons.more_horiz_rounded),
];

/// Static form UI — amount/category/wallet/date/note are all local UI
/// state. Persisting a transaction (and updating the wallet balance) is
/// logic-layer work; the Save button is intentionally disabled until then.
class AddTransactionView extends StatefulWidget {
  const AddTransactionView({super.key});

  @override
  State<AddTransactionView> createState() => _AddTransactionViewState();
}

class _AddTransactionViewState extends State<AddTransactionView> {
  bool _isExpense = true;
  int _categoryIndex = 0;
  int _walletIndex = 0;
  DateTime _date = DateTime.now();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  // TODO(logic): replace with the signed-in user's real wallets.
  static const _wallets = ['Cash', 'Bank Card', 'Savings'];

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;
    final categories = _isExpense ? _expenseCategories : _incomeCategories;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
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
              // Expense / Income toggle.
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: colors.surfaceAlt,
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _TypeToggleButton(
                        label: 'Expense',
                        selected: _isExpense,
                        color: colors.expense,
                        onTap: () => setState(() {
                          _isExpense = true;
                          _categoryIndex = 0;
                        }),
                      ),
                    ),
                    Expanded(
                      child: _TypeToggleButton(
                        label: 'Income',
                        selected: !_isExpense,
                        color: colors.income,
                        onTap: () => setState(() {
                          _isExpense = false;
                          _categoryIndex = 0;
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Amount.
              Center(
                child: Column(
                  children: [
                    Text('Amount', style: textTheme.bodyMedium),
                    const SizedBox(height: AppSpacing.xs),
                    IntrinsicWidth(
                      child: TextField(
                        controller: _amountController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        textAlign: TextAlign.center,
                        style: textTheme.displayLarge?.copyWith(
                          color: _isExpense ? colors.expense : colors.income,
                        ),
                        decoration: InputDecoration(
                          hintText: '0.00',
                          prefixText: 'EGP ',
                          prefixStyle: textTheme.displayLarge?.copyWith(
                            color: (_isExpense ? colors.expense : colors.income)
                                .withValues(alpha: 0.6),
                            fontSize: 22,
                          ),
                          filled: false,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Category.
              Text('Category', style: textTheme.labelMedium),
              const SizedBox(height: AppSpacing.sm),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: AppSpacing.sm,
                  crossAxisSpacing: AppSpacing.sm,
                  childAspectRatio: 0.82,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final selected = index == _categoryIndex;
                  return _CategoryTile(
                    label: category.label,
                    icon: category.icon,
                    selected: selected,
                    onTap: () => setState(() => _categoryIndex = index),
                  );
                },
              ),
              const SizedBox(height: AppSpacing.xl),

              // Wallet.
              Text('Wallet', style: textTheme.labelMedium),
              const SizedBox(height: AppSpacing.sm),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: List.generate(_wallets.length, (index) {
                  return _WalletChip(
                    label: _wallets[index],
                    selected: index == _walletIndex,
                    onTap: () => setState(() => _walletIndex = index),
                  );
                }),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Date.
              Text('Date', style: textTheme.labelMedium),
              const SizedBox(height: AppSpacing.sm),
              InkWell(
                borderRadius: BorderRadius.circular(AppRadius.md),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _date,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) setState(() => _date = picked);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.md,
                  ),
                  decoration: BoxDecoration(
                    color: colors.surfaceAlt,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 18,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        '${_date.day}/${_date.month}/${_date.year}',
                        style: textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              AppTextField(
                label: 'Note (optional)',
                hint: 'e.g. Lunch with friends',
                controller: _noteController,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: AppSpacing.xl),

              AppPrimaryButton(
                label: 'Save Transaction',
                // TODO(logic): persist the transaction and update the
                // selected wallet's balance, then pop back to Home.
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TypeToggleButton extends StatelessWidget {
  const _TypeToggleButton({
    required this.label,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm + 2),
        decoration: BoxDecoration(
          color: selected ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: textTheme.labelLarge?.copyWith(
            color: selected ? Colors.white : textTheme.bodyLarge?.color,
          ),
        ),
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: selected ? scheme.primary : colors.surfaceAlt,
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? scheme.primary : colors.border,
              ),
            ),
            child: Icon(
              icon,
              size: 22,
              color: selected ? scheme.onPrimary : Theme.of(context).iconTheme.color,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.labelMedium?.copyWith(
              color: selected ? scheme.primary : textTheme.labelMedium?.color,
            ),
          ),
        ],
      ),
    );
  }
}

class _WalletChip extends StatelessWidget {
  const _WalletChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: selected ? scheme.primary.withValues(alpha: 0.12) : colors.surfaceAlt,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          border: Border.all(
            color: selected ? scheme.primary : colors.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              size: 16,
              color: selected ? scheme.primary : Theme.of(context).iconTheme.color,
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              label,
              style: textTheme.labelLarge?.copyWith(
                color: selected ? scheme.primary : textTheme.bodyLarge?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
