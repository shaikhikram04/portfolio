import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/colors.dart';

/// Decorative background layer for the hero section.
///
/// Renders:
///  1. A large radial glow from the top-centre.
///  2. Scattered floating tech / code icons at the four screen corners.
///  3. Small dot accents randomly placed.
class BackgroundDecorations extends StatelessWidget {
  const BackgroundDecorations({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ── 1. Top-centre glow ──────────────────────────────────────────
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0.0, -1.3),
                radius: 1.1,
                colors: [
                  AppColors.glowColor.withValues(alpha: 0.18),
                  AppColors.glowColor.withValues(alpha: 0.07),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.4, 1.0],
              ),
            ),
          ),
        ),

        // ── 2. Floating decorative icons ────────────────────────────────

        // Code brackets – top-right corner
        Positioned(
          top: 80,
          right: 80,
          child: _DecorIcon(
            icon: Icons.code_rounded,
            size: 28,
            opacity: 0.22,
          ),
        ),

        // Layers / stack – top-left corner
        Positioned(
          top: 120,
          left: 90,
          child: _DecorIcon(
            icon: FontAwesomeIcons.layerGroup,
            size: 24,
            opacity: 0.20,
          ),
        ),

        // Lightning bolt – bottom-left
        Positioned(
          bottom: 160,
          left: 80,
          child: _DecorIcon(
            icon: Icons.bolt_rounded,
            size: 26,
            opacity: 0.18,
          ),
        ),

        // Desktop / monitor – bottom-right
        Positioned(
          bottom: 120,
          right: 110,
          child: _DecorIcon(
            icon: Icons.desktop_mac_rounded,
            size: 26,
            opacity: 0.18,
          ),
        ),

        // ── 3. Scatter dots ─────────────────────────────────────────────
        const Positioned(
          top: 230,
          left: 210,
          child: _Dot(),
        ),
        const Positioned(
          top: 340,
          right: 220,
          child: _Dot(),
        ),
        const Positioned(
          bottom: 260,
          left: 300,
          child: _Dot(),
        ),
        const Positioned(
          top: 160,
          left: 440,
          child: _Dot(size: 3),
        ),
        const Positioned(
          bottom: 200,
          right: 320,
          child: _Dot(size: 3),
        ),
      ],
    );
  }
}

// ── Reusable private widgets ─────────────────────────────────────────────────

class _DecorIcon extends StatelessWidget {
  const _DecorIcon({
    required this.icon,
    this.size = 24,
    this.opacity = 0.2,
  });

  final IconData icon;
  final double size;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Icon(
        icon,
        color: AppColors.decorIcon,
        size: size,
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({this.size = 4});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary.withValues(alpha: 0.35),
      ),
    );
  }
}
