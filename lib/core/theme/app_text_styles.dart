import 'package:flutter/material.dart';

/// Sora carries headlines and numbers — Manrope carries everything you read
/// in a paragraph or type into a field. Two roles, never mixed mid-string.
/// Both are bundled under assets/fonts/ (see pubspec.yaml) — no runtime
/// font fetching, so the app never depends on network access for text.
class AppTextStyles {
  const AppTextStyles._();

  static TextTheme textTheme(Color ink, Color inkMuted) {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Sora',
        fontSize: 34,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: -0.4,
        color: ink,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Sora',
        fontSize: 25,
        fontWeight: FontWeight.w700,
        height: 1.25,
        letterSpacing: -0.2,
        color: ink,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Sora',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: ink,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: ink,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 14.5,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: inkMuted,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 15.5,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.1,
        color: ink,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Manrope',
        fontSize: 12.5,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        color: inkMuted,
      ),
    );
  }
}
