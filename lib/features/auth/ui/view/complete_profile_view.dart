import 'package:expensetracker/features/auth/ui/logic/complete_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/ui/app_primary_button.dart';
import '../../../../core/ui/selectable_chip.dart';

/// One-time onboarding step. [userName] is a constructor input, not a
/// fetch — the logic layer resolves the real name and passes it in.
/// Currency/language selection is local UI state; persisting the choice
/// (and setting `profiles.onboarding_completed`) is logic-layer work.
class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key, this.userName});

  final String? userName;

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  static const _currencies = ['EGP', 'USD', 'SAR'];
  static const _languages = ['Arabic', 'English'];

  String _currency = _currencies.first;
  String _language = _languages.last;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final greeting = widget.userName == null || widget.userName!.isEmpty
        ? 'Welcome 👋'
        : 'Welcome, ${widget.userName} 👋';

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.xl,
            AppSpacing.lg,
            AppSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(greeting, style: textTheme.headlineMedium),
              const SizedBox(height: AppSpacing.xs),
              Text(
                "Just two quick things and you're set.",
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.xl),
              Text('Choose Currency', style: textTheme.labelMedium),
              const SizedBox(height: AppSpacing.sm),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
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
              Text('Choose Language', style: textTheme.labelMedium),
              const SizedBox(height: AppSpacing.sm),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: _languages
                    .map(
                      (l) => SelectableChip(
                        label: l,
                        selected: _language == l,
                        onTap: () => setState(() => _language = l),
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              AppPrimaryButton(
                label: 'Continue',
                      onPressed: () {
                        context.read<CompleteProfileCubit>().completeProfile(
                              currency: _currency, language: _language);
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
