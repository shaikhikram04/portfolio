import 'package:flutter/material.dart';
import 'package:ikram_portfolio/core/constants/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.badgeText,
    required this.leadingText,
    required this.highlightedText,
    required this.badgeStyle,
    required this.leadingStyle,
    required this.highlightedStyle,
    this.badgeBottomSpacing = 12,
  });

  final String badgeText;
  final String leadingText;
  final String highlightedText;
  final TextStyle badgeStyle;
  final TextStyle leadingStyle;
  final TextStyle highlightedStyle;
  final double badgeBottomSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(badgeText, style: badgeStyle),
        SizedBox(height: badgeBottomSpacing),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(leadingText, style: leadingStyle),
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: AppColors.primaryGradient,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
              blendMode: BlendMode.srcIn,
              child: Text(
                highlightedText,
                style: highlightedStyle.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
