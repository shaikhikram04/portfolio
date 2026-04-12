import 'package:flutter/material.dart';
import 'package:ikram_portfolio/core/constants/app_colors.dart';

class SectionBackdrop extends StatelessWidget {
  const SectionBackdrop({super.key, this.yOffset = -1.5, this.radius = 1});

  final double yOffset;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0.0, yOffset),
                  radius: radius,
                  colors: [
                    AppColors.glowColor.withValues(alpha: 0.4),
                    AppColors.glowColor.withValues(alpha: 0.1),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.3, 0.8],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
