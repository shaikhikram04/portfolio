import 'package:flutter/material.dart';

/// Central color palette for the portfolio app.
/// All colors are derived from the dark-teal design system shown in the mockup.
class AppColors {
  const AppColors._();

  // ── Background ─────────────────────────────────────────────────────────────
  /// Main page background – deep dark navy.
  static const Color background = Color(0xFF1A2035);

  /// Slightly lighter surface for cards / nav.
  static const Color surface = Color(0xFF1E2540);

  /// Darkened pill / badge bg.
  static const Color badgeBg = Color(0xFF141926);

  // ── Brand / Accent ─────────────────────────────────────────────────────────
  /// Primary teal – used for logo, "Ikram", animated text, borders.
  static const Color primary = Color(0xFF1AE6BD);

  /// Secondary indigo / blue-purple – used for "Shaikh" gradient end.
  static const Color secondary = Color(0xFF7C85F5);

  /// Deep purple accent – gradient buttons, underline.
  static const Color accent = Color(0xFF6952E0);

  // ── Text ───────────────────────────────────────────────────────────────────
  /// Pure white – heading base color.
  static const Color textPrimary = Color(0xFFFFFFFF);

  /// Light grey – navigation links, body text.
  static const Color textSecondary = Color(0xFFB8C4D4);

  /// Muted grey – subtitles, descriptions.
  static const Color textMuted = Color(0xFF7E8A9A);

  // ── UI Elements ────────────────────────────────────────────────────────────
  /// Border for outlined buttons / social icons.
  static const Color border = Color(0xFF2E3A50);

  /// Background glow tint (radial, very translucent).
  static const Color glowColor = Color(0xFF1AE6BD);

  /// Decorative floating icon color.
  static const Color decorIcon = Color(0xFF1AE6BD);

  // ── Gradients (convenience) ────────────────────────────────────────────────
  /// Primary CTA button gradient – teal → purple.
  static const List<Color> primaryGradient = [primary, accent];

  /// Name "Shaikh" gradient – teal → indigo.
  static const List<Color> shaikhGradient = [secondary, accent];

  /// Underline gradient – teal → purple.
  static const List<Color> underlineGradient = [primary, accent];
}
