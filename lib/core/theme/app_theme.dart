import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light => _build(
        brightness: Brightness.light,
        bg: const Color(0xFFF7F8F5),
        surface: const Color(0xFFFFFFFF),
        ink: const Color(0xFF12211C),
        inkMuted: const Color(0xFF5C6E67),
        primary: const Color(0xFF0E6F58),
        onPrimary: const Color(0xFFFFFFFF),
        extension: AppColors.light,
      );

  static ThemeData get dark => _build(
        brightness: Brightness.dark,
        bg: const Color(0xFF0E1512),
        surface: const Color(0xFF16201C),
        ink: const Color(0xFFEDF2EF),
        inkMuted: const Color(0xFF9FB0A9),
        primary: const Color(0xFF35C79A),
        onPrimary: const Color(0xFF08211A),
        extension: AppColors.dark,
      );

  static ThemeData _build({
    required Brightness brightness,
    required Color bg,
    required Color surface,
    required Color ink,
    required Color inkMuted,
    required Color primary,
    required Color onPrimary,
    required AppColors extension,
  }) {
    final textTheme = AppTextStyles.textTheme(ink, inkMuted);
    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      secondary: extension.accent,
      onSecondary: extension.onAccent,
      error: extension.expense,
      onError: Colors.white,
      surface: surface,
      onSurface: ink,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: bg,
      colorScheme: colorScheme,
      textTheme: textTheme,
      extensions: [extension],
      splashFactory: InkSparkle.splashFactory,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: extension.surfaceAlt,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        hintStyle: textTheme.bodyLarge?.copyWith(color: inkMuted),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: extension.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: extension.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: primary, width: 1.6),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: extension.expense, width: 1.4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: extension.expense, width: 1.6),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          minimumSize: const Size.fromHeight(54),
          elevation: 0,
          textStyle: textTheme.labelLarge?.copyWith(color: onPrimary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ink,
          minimumSize: const Size.fromHeight(54),
          side: BorderSide(color: extension.border),
          textStyle: textTheme.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          textStyle: textTheme.labelLarge?.copyWith(color: primary),
        ),
      ),
      dividerTheme: DividerThemeData(color: extension.divider, thickness: 1),
      iconTheme: IconThemeData(color: inkMuted),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: primary),
    );
  }
}
