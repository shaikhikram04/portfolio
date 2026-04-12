import 'package:flutter/material.dart';
import 'package:ikram_portfolio/app/theme/app_text_styles.dart';
import 'package:ikram_portfolio/core/constants/app_colors.dart';

class PortfolioLogoText extends StatelessWidget {
  const PortfolioLogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: AppColors.highlightGradient,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      blendMode: BlendMode.srcIn,
      child: Text(
        'IK.',
        style: AppTextStyles.logo.copyWith(color: Colors.white),
      ),
    );
  }
}
