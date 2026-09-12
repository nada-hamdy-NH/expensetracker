import 'package:flutter/material.dart';

import '../../../../../core/theme/app_spacing.dart';

/// Back arrow + title + subtitle, shared by every auth screen that isn't
/// Welcome or Complete Profile (which have their own opening beats).
class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.onBack,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: onBack ?? () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          padding: EdgeInsets.zero,
          alignment: Alignment.centerLeft,
          constraints: const BoxConstraints(),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(title, style: textTheme.headlineMedium),
        const SizedBox(height: AppSpacing.xs),
        Text(subtitle, style: textTheme.bodyMedium),
      ],
    );
  }
}
