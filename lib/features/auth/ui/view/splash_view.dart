import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/ui/flow_mark.dart';

/// Pure display — no session check, no timer, no navigation. The logic
/// layer decides what happens after this and for how long it's shown.
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FlowMark(size: 84),
            const SizedBox(height: AppSpacing.lg),
            Text('Flow', style: textTheme.displayLarge),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Take control of your money',
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.xxl),
            const SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(strokeWidth: 2.4),
            ),
          ],
        ),
      ),
    );
  }
}
