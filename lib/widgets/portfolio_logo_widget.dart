import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../theme/app_text_styles.dart';

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
