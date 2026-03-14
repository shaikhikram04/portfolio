import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

/// Centralised text-style definitions.
///
/// All styles are derived from the [Poppins] font family (body / UI) and
/// [Fira Code] (monospace / code snippets).  Import this class wherever you
/// need a text style rather than constructing inline [TextStyle]s.
class AppTextStyles {
  const AppTextStyles._();

  // ── Logo ─────────────────────────────────────────────────────────────────
  static TextStyle get logo => GoogleFonts.robotoMono(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
    letterSpacing: 1.2,
  );

  // ── Navigation ───────────────────────────────────────────────────────────
  static TextStyle get navLink => GoogleFonts.notoSansKaithi(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary.withValues(alpha: 0.6),
    letterSpacing: 0.3,
  );

  static TextStyle get navLinkActive => GoogleFonts.notoSansKaithi(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    letterSpacing: 0.3,
  );

  // ── Badge / Pill ─────────────────────────────────────────────────────────
  static TextStyle get badge => GoogleFonts.robotoMono(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
    letterSpacing: 0.5,
  );

  // ── Hero Heading ─────────────────────────────────────────────────────────
  /// "Hi, I'm " – white portion of the main headline.
  static TextStyle get heroHeadingBase => GoogleFonts.notoSansKaithi(
    fontSize: 68,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.15,
    letterSpacing: -1.0,
  );

  /// "Ikram" – teal accent in the headline.
  static TextStyle get heroHeadingTeal => GoogleFonts.notoSansKaithi(
    fontSize: 68,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    height: 1.15,
    letterSpacing: -1.0,
  );

  /// "Shaikh" – blue-purple gradient mask base (white so ShaderMask shows).
  static TextStyle get heroHeadingGradient => GoogleFonts.notoSansKaithi(
    fontSize: 68,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    height: 1.15,
    letterSpacing: -1.0,
  );

  // ── Animated Subtitle ────────────────────────────────────────────────────
  /// "I'm a " static prefix.
  static TextStyle get subtitleBase => GoogleFonts.notoSansKaithi(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  /// Typed animated portion – teal highlight.
  static TextStyle get subtitleAnimated => GoogleFonts.notoSansKaithi(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
    height: 1.4,
  );

  // ── Body / Description ───────────────────────────────────────────────────
  static TextStyle get bodyDescription => GoogleFonts.notoSansKaithi(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    height: 1.7,
    letterSpacing: 0.1,
  );

  // ── Buttons ──────────────────────────────────────────────────────────────
  static TextStyle get buttonPrimary => GoogleFonts.notoSansKaithi(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
    letterSpacing: 0.3,
  );

  static TextStyle get buttonOutlined => GoogleFonts.notoSansKaithi(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    letterSpacing: 0.3,
  );
}
