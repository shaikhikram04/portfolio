import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ikram_portfolio/core/constants/app_colors.dart';

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
        Positioned.fill(child: CustomPaint(painter: _GridPainter())),

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
                stops: const [0.0, 0.3, 0.8],
              ),
            ),
          ),
        ),

        // ── 3. Floating decorative icons (each with a unique phase) ──────

        // Code brackets – top-right
        Positioned(
          top: 120,
          right: 120,
          child: _FloatingIcon(
            icon: Icons.code_rounded,
            size: 48,
            opacity: 0.22,
            phase: 0.0,
            floatHeight: 14,
            rotationRange: 0.12,
            duration: const Duration(milliseconds: 3200),
          ),
        ),

        // Layers / stack – top-left
        Positioned(
          top: 120,
          left: 90,
          child: _FloatingIcon(
            icon: FontAwesomeIcons.layerGroup,
            size: 38,
            opacity: 0.20,
            phase: 0.3,
            floatHeight: 10,
            rotationRange: 0.08,
            duration: const Duration(milliseconds: 2800),
          ),
        ),

        // Lightning bolt – bottom-left
        Positioned(
          bottom: 160,
          left: 120,
          child: _FloatingIcon(
            icon: Icons.electric_bolt_rounded,
            size: 42,
            opacity: 0.18,
            phase: 0.6,
            floatHeight: 12,
            rotationRange: 0.10,
            duration: const Duration(milliseconds: 3600),
          ),
        ),

        // Desktop / monitor – bottom-right
        Positioned(
          bottom: 210,
          right: 140,
          child: _FloatingIcon(
            icon: Icons.desktop_mac_rounded,
            size: 42,
            opacity: 0.18,
            phase: 0.15,
            floatHeight: 11,
            rotationRange: 0.07,
            duration: const Duration(milliseconds: 3000),
          ),
        ),

        // ── 4. Scatter dots (floating, each with unique phase) ───────────
        const Positioned(
          top: 230,
          left: 210,
          child: _FloatingDot(
            size: 4,
            phase: 0.0,
            duration: Duration(milliseconds: 2600),
          ),
        ),
        const Positioned(
          top: 340,
          right: 220,
          child: _FloatingDot(
            size: 4,
            phase: 0.5,
            duration: Duration(milliseconds: 3100),
          ),
        ),
        const Positioned(
          bottom: 260,
          left: 300,
          child: _FloatingDot(
            size: 4,
            phase: 0.2,
            duration: Duration(milliseconds: 2900),
          ),
        ),
        const Positioned(
          top: 160,
          left: 440,
          child: _FloatingDot(
            size: 3,
            phase: 0.75,
            duration: Duration(milliseconds: 3400),
          ),
        ),
        const Positioned(
          bottom: 200,
          right: 320,
          child: _FloatingDot(
            size: 3,
            phase: 0.4,
            duration: Duration(milliseconds: 2700),
          ),
        ),
        // Extra dots – spread across the canvas
        const Positioned(
          top: 80,
          left: 320,
          child: _FloatingDot(
            size: 3,
            phase: 0.1,
            duration: Duration(milliseconds: 3200),
          ),
        ),
        const Positioned(
          top: 80,
          right: 400,
          child: _FloatingDot(
            size: 4,
            phase: 0.65,
            duration: Duration(milliseconds: 2500),
          ),
        ),
        const Positioned(
          top: 200,
          right: 160,
          child: _FloatingDot(
            size: 3,
            phase: 0.35,
            duration: Duration(milliseconds: 3700),
          ),
        ),
        const Positioned(
          top: 420,
          left: 140,
          child: _FloatingDot(
            size: 5,
            phase: 0.85,
            duration: Duration(milliseconds: 2800),
          ),
        ),
        const Positioned(
          top: 480,
          right: 100,
          child: _FloatingDot(
            size: 3,
            phase: 0.55,
            duration: Duration(milliseconds: 3300),
          ),
        ),
        const Positioned(
          top: 480,
          left: 520,
          child: _FloatingDot(
            size: 4,
            phase: 0.22,
            duration: Duration(milliseconds: 2950),
          ),
        ),
        const Positioned(
          bottom: 380,
          left: 180,
          child: _FloatingDot(
            size: 3,
            phase: 0.7,
            duration: Duration(milliseconds: 3550),
          ),
        ),
        const Positioned(
          bottom: 380,
          right: 240,
          child: _FloatingDot(
            size: 5,
            phase: 0.45,
            duration: Duration(milliseconds: 2650),
          ),
        ),
        const Positioned(
          bottom: 100,
          left: 420,
          child: _FloatingDot(
            size: 3,
            phase: 0.9,
            duration: Duration(milliseconds: 3050),
          ),
        ),
        const Positioned(
          bottom: 80,
          right: 160,
          child: _FloatingDot(
            size: 4,
            phase: 0.15,
            duration: Duration(milliseconds: 2750),
          ),
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

// ── Animated floating icon ───────────────────────────────────────────────────

/// Renders a teal [icon] that gently bobs up/down and rocks side-to-side,
/// like an air bubble floating in water.  Each instance accepts a [phase]
/// (0.0–1.0) so multiple icons can float out of sync.
class _FloatingIcon extends StatefulWidget {
  const _FloatingIcon({
    required this.icon,
    required this.phase,
    this.size = 24,
    this.opacity = 0.2,
    this.floatHeight = 12,
    this.rotationRange = 0.10,
    this.duration = const Duration(milliseconds: 3000),
  });

  final IconData icon;
  final double size;
  final double opacity;

  /// Peak vertical travel in logical pixels (half above, half below origin).
  final double floatHeight;

  /// Max rotation in radians (applied as ±rotationRange).
  final double rotationRange;

  /// Full period of one up→down cycle.
  final Duration duration;

  /// Start offset (0.0–1.0) so icons are staggered.
  final double phase;

  @override
  State<_FloatingIcon> createState() => _FloatingIconState();
}

class _FloatingIconState extends State<_FloatingIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _float;
  late final Animation<double> _rotate;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.duration)
      ..value = widget.phase
      ..repeat(reverse: true);

    // Vertical bob: floatHeight → -floatHeight
    _float = Tween<double>(
      begin: widget.floatHeight,
      end: -widget.floatHeight,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));

    // Gentle tilt: +rotationRange → -rotationRange
    _rotate = Tween<double>(
      begin: widget.rotationRange,
      end: -widget.rotationRange,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, child) => Transform.translate(
        offset: Offset(0, _float.value),
        child: Transform.rotate(angle: _rotate.value, child: child),
      ),
      child: Opacity(
        opacity: widget.opacity,
        child: Icon(widget.icon, color: AppColors.decorIcon, size: widget.size),
      ),
    );
  }
}

// ── Animated floating dot ────────────────────────────────────────────────────

/// A small circle dot that floats vertically, mirroring [_FloatingIcon].
class _FloatingDot extends StatefulWidget {
  const _FloatingDot({
    this.size = 4,
    this.phase = 0.0,
    this.duration = const Duration(milliseconds: 3000),
  });

  final double size;
  final double phase;
  final Duration duration;

  @override
  State<_FloatingDot> createState() => _FloatingDotState();
}

class _FloatingDotState extends State<_FloatingDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _float;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.duration)
      ..value = widget.phase
      ..repeat(reverse: true);

    _float = Tween<double>(
      begin: 6,
      end: -6,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, child) =>
          Transform.translate(offset: Offset(0, _float.value), child: child),
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary.withValues(alpha: 0.35),
        ),
      ),
    );
  }
}
