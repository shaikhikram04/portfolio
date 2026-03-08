import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'widgets/background_decorations_widget.dart';
import 'widgets/hero_section_widget.dart';
import 'widgets/navbar_widget.dart';

/// Root page of the portfolio.
///
/// Composes the [PortfolioNavBar] + hero content inside a [Stack] that renders
/// the [BackgroundDecorations] layer first, ensuring the glow and floating icons
/// sit behind the foreground content.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const PortfolioDrawer(activeSection: 'Home'),
      body: Stack(
        children: [
          // ── Layer 0: ambient glow + floating icons ──────────────────
          const Positioned.fill(
            child: BackgroundDecorations(),
          ),

          // ── Layer 1: scrollable page content ───────────────────────
          Column(
            children: [
              // Sticky navigation bar
              PortfolioNavBar(activeSection: 'Home'),

              // Hero fills remaining height
              Expanded(
                child: const HeroSection(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
