import 'package:flutter/material.dart';
import 'package:ikram_portfolio/core/constants/app_colors.dart';

class HoverGradientButton extends StatefulWidget {
  const HoverGradientButton({
    super.key,
    required this.child,
    required this.onTap,
    this.width,
    this.height,
    this.padding,
    this.borderRadius = 12,
    this.duration = const Duration(milliseconds: 180),
    this.gradientColors = AppColors.primaryGradient,
    this.hoverGradientColors = AppColors.highlightGradient,
    this.gradientStops = const [0.2, 0.9],
    this.hoverGradientStops = const [0.3, 0.9],
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
  });

  final Widget child;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final Duration duration;
  final List<Color> gradientColors;
  final List<Color> hoverGradientColors;
  final List<double> gradientStops;
  final List<double> hoverGradientStops;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  @override
  State<HoverGradientButton> createState() => _HoverGradientButtonState();
}

class _HoverGradientButtonState extends State<HoverGradientButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: widget.duration,
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              colors: _hovered
                  ? widget.hoverGradientColors
                  : widget.gradientColors,
              begin: widget.begin,
              end: widget.end,
              stops: _hovered
                  ? widget.hoverGradientStops
                  : widget.gradientStops,
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
