import 'package:flutter/material.dart';

/// Full-width outlined action — used for the secondary path (e.g. "Create
/// Account" on Welcome) or an icon-led option like "Continue with Google".
class AppOutlineButton extends StatelessWidget {
  const AppOutlineButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return OutlinedButton(onPressed: onPressed, child: Text(label));
    }
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon!,
      label: Text(label),
    );
  }
}
