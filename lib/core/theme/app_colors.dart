import 'package:flutter/material.dart';

/// Extra semantic colors that [ColorScheme] doesn't cover.
/// Access via `Theme.of(context).extension<AppColors>()!`.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.surfaceAlt,
    required this.accent,
    required this.onAccent,
    required this.accentSoft,
    required this.expense,
    required this.income,
    required this.border,
    required this.divider,
  });

  final Color surfaceAlt;
  final Color accent;
  final Color onAccent;
  final Color accentSoft;
  final Color expense;
  final Color income;
  final Color border;
  final Color divider;

  static const light = AppColors(
    surfaceAlt: Color(0xFFEFF3EF),
    accent: Color(0xFFFF7A50),
    onAccent: Color(0xFFFFFFFF),
    accentSoft: Color(0xFFFFE7DE),
    expense: Color(0xFFD64545),
    income: Color(0xFF0E6F58),
    border: Color(0xFFDEE5E0),
    divider: Color(0xFFE7ECE8),
  );

  static const dark = AppColors(
    surfaceAlt: Color(0xFF1D2925),
    accent: Color(0xFFFF9770),
    onAccent: Color(0xFF2B1006),
    accentSoft: Color(0xFF3A241C),
    expense: Color(0xFFFF6B6B),
    income: Color(0xFF35C79A),
    border: Color(0xFF29352F),
    divider: Color(0xFF223029),
  );

  @override
  AppColors copyWith({
    Color? surfaceAlt,
    Color? accent,
    Color? onAccent,
    Color? accentSoft,
    Color? expense,
    Color? income,
    Color? border,
    Color? divider,
  }) {
    return AppColors(
      surfaceAlt: surfaceAlt ?? this.surfaceAlt,
      accent: accent ?? this.accent,
      onAccent: onAccent ?? this.onAccent,
      accentSoft: accentSoft ?? this.accentSoft,
      expense: expense ?? this.expense,
      income: income ?? this.income,
      border: border ?? this.border,
      divider: divider ?? this.divider,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      surfaceAlt: Color.lerp(surfaceAlt, other.surfaceAlt, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      onAccent: Color.lerp(onAccent, other.onAccent, t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      expense: Color.lerp(expense, other.expense, t)!,
      income: Color.lerp(income, other.income, t)!,
      border: Color.lerp(border, other.border, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
    );
  }
}

extension AppColorsX on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}
