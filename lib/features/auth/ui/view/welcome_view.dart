import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/ui/app_outline_button.dart';
import '../../../../core/ui/app_primary_button.dart';
import '../../../../core/ui/flow_mark.dart';

/// The opening pitch, not the login form — the docs call this "simple
/// routing logic," which a View is allowed to own.
class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final colors = context.colors;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -70,
            right: -60,
            child: _Blob(size: 220, color: scheme.primary.withValues(alpha: 0.10)),
          ),
          Positioned(
            top: 140,
            left: -90,
            child: _Blob(size: 180, color: colors.accent.withValues(alpha: 0.12)),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Column(
                children: [
                  const SizedBox(height: AppSpacing.xl),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: FlowMark(size: 48),
                  ),
                  const Spacer(),
                  Text(
                    'Take control of your money.',
                    style: textTheme.displayLarge,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Track spending, build habits, and see exactly '
                    'where your money goes — every day, in seconds.',
                    style: textTheme.bodyLarge?.copyWith(
                      color: textTheme.bodyMedium?.color,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  AppPrimaryButton(
                    label: 'Log In',
                    onPressed: () => context.push(AppRoutes.login),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  AppOutlineButton(
                    label: 'Create Account',
                    onPressed: () => context.push(AppRoutes.signUp),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Blob extends StatelessWidget {
  const _Blob({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
