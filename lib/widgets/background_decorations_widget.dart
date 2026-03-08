import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/colors.dart';

/// Decorative background layer for the hero section.
///
/// Renders:
///  1. A subtle dot-grid pattern across the full canvas.
///  2. A large radial glow from the top-centre (overlaid on the grid).
///  3. Scattered floating tech / code icons at the four screen corners.
///  4. Small dot accents randomly placed.
class BackgroundDecorations extends StatelessWidget {
  const BackgroundDecorations({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ── 1. Grid ─────────────────────────────────────────────────────
        Positioned.fill(
          child: CustomPaint(
            painter: _GridPainter(),
          ),
        ),

        // ── 2. Top-centre radial glow (sits on top of grid) ─────────────
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0.0, -1.3),
                radius: 1.5,
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

        // ── 3. Floating decorative icons ────────────────────────────────

        // Code brackets – top-right corner
        Positioned(
          top: 120,
          right: 120,
          child: _DecorIcon(
            icon: Icons.code_rounded,
            size: 48,
            opacity: 0.22,
          ),
        ),

        // Layers / stack – top-left corner
        Positioned(
          top: 120,
          left: 90,
          child: _DecorIcon(
            icon: FontAwesomeIcons.layerGroup,
            size: 38,
            opacity: 0.20,
          ),
        ),

        // Lightning bolt – bottom-left
        Positioned(
          bottom: 160,
          left: 120,
          child: _DecorIcon(
            icon: Icons.electric_bolt_rounded,
            size: 42,
            opacity: 0.18,
          ),
        ),

        // Desktop / monitor – bottom-right
        Positioned(
          bottom: 210,
          right: 140,
          child: _DecorIcon(
            icon: Icons.desktop_mac_rounded,
            size: 42,
            opacity: 0.18,
          ),
        ),

        // ── 4. Scatter dots ─────────────────────────────────────────────
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

// ── Grid painter ─────────────────────────────────────────────────────────────

/// Paints a full-canvas grid of fine lines using the primary teal at very
/// low opacity, giving the classic dark-portfolio grid effect.
class _GridPainter extends CustomPainter {
  /// Spacing between grid lines in logical pixels.
  static const double _spacing = 68;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border.withValues(alpha: 0.24)
      ..strokeWidth = 0.8
      ..style = PaintingStyle.stroke;

    // Vertical lines
    for (double x = 0; x <= size.width; x += _spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Horizontal lines
    for (double y = 0; y <= size.height; y += _spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) => false;
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
