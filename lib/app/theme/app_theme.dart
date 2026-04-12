import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikram_portfolio/core/constants/app_colors.dart';

/// Application-wide [ThemeData] configuration.
///
/// Usage:
/// ```dart
/// MaterialApp(
///   theme: AppTheme.dark,
/// )
/// ```
class AppTheme {
  const AppTheme._();

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        surface: AppColors.card,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        tertiary: AppColors.accent,
        onPrimary: AppColors.primaryForeground,
        onSecondary: AppColors.secondaryForeground,
        onSurface: AppColors.foreground,
        outline: AppColors.border,
        error: AppColors.destructive,
      ),
      // ── Typography ────────────────────────────────────────────────────────
      textTheme: GoogleFonts.interTextTheme(
        const TextTheme(
          displayLarge: TextStyle(color: AppColors.foreground),
          displayMedium: TextStyle(color: AppColors.foreground),
          displaySmall: TextStyle(color: AppColors.foreground),
          headlineLarge: TextStyle(color: AppColors.foreground),
          headlineMedium: TextStyle(color: AppColors.foreground),
          headlineSmall: TextStyle(color: AppColors.foreground),
          titleLarge: TextStyle(color: AppColors.foreground),
          titleMedium: TextStyle(color: AppColors.secondaryForeground),
          titleSmall: TextStyle(color: AppColors.secondaryForeground),
          bodyLarge: TextStyle(color: AppColors.secondaryForeground),
          bodyMedium: TextStyle(color: AppColors.secondaryForeground),
          bodySmall: TextStyle(color: AppColors.mutedForeground),
          labelLarge: TextStyle(color: AppColors.foreground),
          labelMedium: TextStyle(color: AppColors.secondaryForeground),
          labelSmall: TextStyle(color: AppColors.mutedForeground),
        ),
      ),
      // ── AppBar ────────────────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.inter(
          color: AppColors.foreground,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: AppColors.foreground),
      ),
      // ── Buttons ───────────────────────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.primaryForeground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.foreground,
          side: const BorderSide(color: AppColors.border, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      // ── Icon ──────────────────────────────────────────────────────────────
      iconTheme: const IconThemeData(
        color: AppColors.secondaryForeground,
        size: 22,
      ),
      // ── Divider ───────────────────────────────────────────────────────────
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
      ),
    );
  }
}
