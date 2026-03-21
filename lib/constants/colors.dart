import 'package:flutter/material.dart';

/// Central color palette for the portfolio app.
/// All colors are derived from the dark-teal design system shown in the mockup.
class AppColors {
  const AppColors._();

  // ── Canonical Design Tokens ────────────────────────────────────────────────
  static const Color background = Color(0xFF0F1117);
  static const Color foreground = Color(0xFFE4E8ED);
  static const Color card = Color(0xFF151921);
  static const Color primary = Color(0xFF1AE5B5);
  static const Color primaryForeground = Color(0xFF0F1117);
  static const Color secondary = Color(0xFF232832);
  static const Color secondaryForeground = Color(0xFFCDD4DC);
  static const Color muted = Color(0xFF1F2329);
  static const Color mutedForeground = Color(0xFF808A9A);
  static const Color accent = Color(0xFF6B4CEB);
  static const Color destructive = Color(0xFFCE3131);
  static const Color border = Color(0xFF272D37);

  // ── Compatibility aliases used across existing widgets ────────────────────
  static const Color surface = card;
  static const Color badgeBg = muted;
  static const Color textPrimary = foreground;
  static const Color textSecondary = secondaryForeground;
  static const Color textMuted = mutedForeground;

  /// Background glow tint (radial, very translucent).
  static const Color glowColor = primary;

  /// Decorative floating icon color.
  static const Color decorIcon = primary;

  // ── Gradients (convenience) ────────────────────────────────────────────────
  /// Primary CTA button gradient – teal → purple.
  static const List<Color> primaryGradient = [primary, accent];

  /// Highlight gradient
  static const List<Color> highlightGradient = [Color(0xFF42F0C8), accent];

  /// Underline gradient – teal → purple.
  static const List<Color> underlineGradient = [primary, accent];
}
