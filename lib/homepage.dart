import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'widgets/about_developer_section_widget.dart';
import 'widgets/background_decorations_widget.dart';
import 'widgets/hero_section_widget.dart';
import 'widgets/navbar_widget.dart';
import 'widgets/projects_section_widget.dart';
import 'widgets/skills_section_widget.dart';
import 'widgets/contact_section_widget.dart';

/// Root page of the portfolio.
///
/// Composes the [PortfolioNavBar] + hero content inside a [Stack] that renders
/// the [BackgroundDecorations] layer first, ensuring the glow and floating icons
/// sit behind the foreground content.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const double _navBarHeight = 88;

  late final ScrollController _scrollController;
  bool _hasScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    final next = _scrollController.offset > 4;
    if (next != _hasScrolled) {
      setState(() => _hasScrolled = next);
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewportHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const PortfolioDrawer(activeSection: 'Home'),
      body: Stack(
        children: [
          // ── Layer 1: scrollable page content ───────────────────────
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(
                  height: viewportHeight,
                  child: Stack(
                    children: [
                      const Positioned.fill(child: BackgroundDecorations()),
                      Column(
                        children: [
                          const SizedBox(height: _navBarHeight),
                          const Expanded(child: HeroSection()),
                        ],
                      ),
                    ],
                  ),
                ),

                // About / developer profile section
                const AboutDeveloperSection(),

                // Projects showcase section
                const ProjectsSection(),

                // Skills section
                const SkillsSection(),

                // Contact section
                const ContactSection(),
              ],
            ),
          ),

          // Sticky top navigation with blur-on-scroll
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PortfolioNavBar(
              activeSection: 'Home',
              isScrolled: _hasScrolled,
            ),
          ),
        ],
      ),
    );
  }
}
