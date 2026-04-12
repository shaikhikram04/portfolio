import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikram_portfolio/core/constants/app_colors.dart';

/// Centralised text-style definitions.
///
/// All styles are derived from [Inter] (headings/body) and
/// [JetBrains Mono] (monospace / code snippets). Import this class wherever you
/// need a text style rather than constructing inline [TextStyle]s.
class AppTextStyles {
  const AppTextStyles._();

  // ── Logo ─────────────────────────────────────────────────────────────────
  static TextStyle get logo => GoogleFonts.jetBrainsMono(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    color: AppColors.primary,
    letterSpacing: 0.8,
  );

  // ── Navigation ───────────────────────────────────────────────────────────
  static TextStyle get navLink => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryForeground.withValues(alpha: 0.72),
    letterSpacing: 0.15,
  );

  static TextStyle get navLinkActive => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    letterSpacing: 0.15,
  );

  // ── Badge / Pill ─────────────────────────────────────────────────────────
  static TextStyle get badge => GoogleFonts.jetBrainsMono(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    letterSpacing: 0.35,
  );

  // ── Hero Heading ─────────────────────────────────────────────────────────
  /// "Hi, I'm " – white portion of the main headline.
  static TextStyle get heroHeadingBase => GoogleFonts.inter(
    fontSize: 68,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    height: 1.12,
    letterSpacing: -1.1,
  );

  /// "Ikram" – teal accent in the headline.
  static TextStyle get heroHeadingTeal => GoogleFonts.inter(
    fontSize: 68,
    fontWeight: FontWeight.w800,
    color: AppColors.primary,
    height: 1.12,
    letterSpacing: -1.1,
  );

  /// "Shaikh" – blue-purple gradient mask base (white so ShaderMask shows).
  static TextStyle get heroHeadingGradient => GoogleFonts.inter(
    fontSize: 68,
    fontWeight: FontWeight.w800,
    color: Colors.white,
    height: 1.12,
    letterSpacing: -1.1,
  );

  // ── Animated Subtitle ────────────────────────────────────────────────────
  /// "I'm a " static prefix.
  static TextStyle get subtitleBase => GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.35,
  );

  /// Typed animated portion – teal highlight.
  static TextStyle get subtitleAnimated => GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    height: 1.35,
  );

  // ── Body / Description ───────────────────────────────────────────────────
  static TextStyle get bodyDescription => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    height: 1.65,
    letterSpacing: 0.1,
  );

  // ── Buttons ──────────────────────────────────────────────────────────────
  static TextStyle get buttonPrimary => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryForeground,
    letterSpacing: 0.2,
  );

  static TextStyle get buttonOutlined => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    letterSpacing: 0.2,
  );

  static TextStyle get mono => GoogleFonts.jetBrainsMono(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryForeground,
    height: 1.55,
  );
}
