import 'package:expensetracker/features/home/ui/view/widgets/wallat_section.dart';
import 'package:expensetracker/features/wallets/data/wallet_model.dart';
import 'package:expensetracker/features/wallets/ui/logic/get_wallets_cubit.dart';
import 'package:expensetracker/features/wallets/ui/logic/get_wallets_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';

/// Static dashboard UI — every number and list item below is placeholder
/// data. The logic layer swaps these for real Cubit-driven state (wallets,
/// transactions, totals) without changing this layout.
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return BlocConsumer<GetWalletsCubit, GetWalletsState>(
      
      listener: (context, state) {} , 
        
      builder: (context, state) {
           final wallets = state is GetWalletsSuccess ? state.wallets : <WalletModel>[];
      return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.md,
                  AppSpacing.lg,
                  0,
                ),
                sliver: SliverToBoxAdapter(child: _Header()),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.lg,
                  AppSpacing.lg,
                  0,
                ),
                sliver: SliverToBoxAdapter(child: _BalanceCard()),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.xl,
                  0,
                  0,
                ),
                sliver: SliverToBoxAdapter(child: WalletsSection(wallets: wallets)),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.xl,
                  AppSpacing.lg,
                  AppSpacing.xxl,
                ),
                sliver: SliverToBoxAdapter(child: _RecentTransactionsSection()),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.push(AppRoutes.addTransaction),
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          icon: const Icon(Icons.add_rounded),
          label: const Text('Add'),
        ),
        bottomNavigationBar: const _BottomNav(),
      );}
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good morning 👋', style: textTheme.bodyMedium),
              const SizedBox(height: AppSpacing.xs),
              // TODO(logic): swap for the signed-in user's real name.
              Text('Nada', style: textTheme.headlineMedium),
            ],
          ),
        ),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: colors.surfaceAlt,
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Icon(
            Icons.notifications_outlined,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ],
    );
  
  }
}

class _BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [scheme.primary, scheme.primary.withValues(alpha: 0.78)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Balance',
            style: textTheme.bodyMedium?.copyWith(
              color: scheme.onPrimary.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          // TODO(logic): sum of all wallet balances for the signed-in user.
          Text(
            'EGP 12,480.00',
            style: textTheme.displayLarge?.copyWith(color: scheme.onPrimary),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Expanded(
                child: _BalanceStat(
                  icon: Icons.south_west_rounded,
                  label: 'Income',
                  // TODO(logic): sum of this month's income transactions.
                  amount: 'EGP 5,200.00',
                  color: scheme.onPrimary,
                ),
              ),
              Container(
                width: 1,
                height: 32,
                color: scheme.onPrimary.withValues(alpha: 0.2),
              ),
              Expanded(
                child: _BalanceStat(
                  icon: Icons.north_east_rounded,
                  label: 'Expense',
                  // TODO(logic): sum of this month's expense transactions.
                  amount: 'EGP 1,860.00',
                  color: scheme.onPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BalanceStat extends StatelessWidget {
  const _BalanceStat({
    required this.icon,
    required this.label,
    required this.amount,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.16),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 16, color: color),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: textTheme.labelMedium?.copyWith(
                    color: color.withValues(alpha: 0.75),
                  ),
                ),
                Text(
                  amount,
                  style: textTheme.labelLarge?.copyWith(color: color),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




class _Transaction {
  const _Transaction(
    this.title,
    this.category,
    this.date,
    this.amount,
    this.isExpense,
    this.icon,
  );
  final String title;
  final String category;
  final String date;
  final String amount;
  final bool isExpense;
  final IconData icon;
}

class _RecentTransactionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = context.colors;

    // TODO(logic): replace with the signed-in user's recent transactions.
    final transactions = [
      _Transaction(
        'Grocery shopping',
        'Food',
        'Today',
        'EGP 320.00',
        true,
        Icons.shopping_basket_outlined,
      ),
      _Transaction(
        'Freelance payment',
        'Income',
        'Yesterday',
        'EGP 2,500.00',
        false,
        Icons.work_outline_rounded,
      ),
      _Transaction(
        'Uber ride',
        'Transport',
        'Yesterday',
        'EGP 85.00',
        true,
        Icons.directions_car_filled_outlined,
      ),
      _Transaction(
        'Netflix subscription',
        'Entertainment',
        '2 days ago',
        'EGP 150.00',
        true,
        Icons.movie_outlined,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recent Transactions', style: textTheme.titleLarge),
            // TODO(logic): navigate to the full transactions list.
            TextButton(onPressed: null, child: const Text('See all')),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        ...transactions.map(
          (t) => Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: colors.surfaceAlt,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: Icon(t.icon, size: 20),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(t.title, style: textTheme.bodyLarge),
                      Text(
                        '${t.category} • ${t.date}',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Text(
                  '${t.isExpense ? '-' : '+'}${t.amount}',
                  style: textTheme.labelLarge?.copyWith(
                    color: t.isExpense ? colors.expense : colors.income,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return NavigationBar(
      selectedIndex: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      indicatorColor: scheme.primary.withValues(alpha: 0.14),
      // TODO(logic): wire tab switching / navigation.
      onDestinationSelected: null,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.bar_chart_rounded),
          label: 'Stats',
        ),
        NavigationDestination(
          icon: Icon(Icons.account_balance_wallet_outlined),
          label: 'Budget',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline_rounded),
          label: 'Profile',
        ),
      ],
    );
  }
}
