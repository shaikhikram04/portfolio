import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'widgets/about_developer_section_widget.dart';
import 'widgets/background_decorations_widget.dart';
import 'widgets/hero_section_widget.dart';
import 'widgets/navbar_widget.dart';
import 'widgets/projects_section_widget.dart';
import 'widgets/skills_section_widget.dart';
import 'widgets/experience_section_widget.dart';
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
  late final Map<String, GlobalKey> _sectionKeys;
  bool _hasScrolled = false;

  @override
  void initState() {
    super.initState();
    _sectionKeys = {
      'Home': GlobalKey(),
      'About': GlobalKey(),
      'Projects': GlobalKey(),
      'Skills': GlobalKey(),
      'Experience': GlobalKey(),
      'Contact': GlobalKey(),
    };
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _scrollToSection(String section) {
    if (!_scrollController.hasClients) return;

    if (section == 'Home') {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOut,
      );
      return;
    }

    final targetContext = _sectionKeys[section]?.currentContext;
    if (targetContext == null) return;

    final renderBox = targetContext.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final targetOffset =
        renderBox.localToGlobal(Offset.zero).dy + _scrollController.offset;

    final clamped = targetOffset.clamp(
      0.0,
      _scrollController.position.maxScrollExtent,
    );
    _scrollController.animateTo(
      clamped,
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeInOutCubic,
    );
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
      drawer: PortfolioDrawer(
        activeSection: 'Home',
        onSectionTap: _scrollToSection,
      ),
      body: Stack(
        children: [
          // ── Layer 1: scrollable page content ───────────────────────
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(
                  key: _sectionKeys['Home'],
                  height: viewportHeight,
                  child: Stack(
                    children: [
                      const Positioned.fill(child: BackgroundDecorations()),
                      Column(
                        children: [
                          const SizedBox(height: _navBarHeight),
                          Expanded(
                            child: HeroSection(
                              onViewProjectsTap: () =>
                                  _scrollToSection('Projects'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // About / developer profile section
                AboutDeveloperSection(key: _sectionKeys['About']),

                // Projects showcase section
                ProjectsSection(key: _sectionKeys['Projects']),

                // Skills section
                SkillsSection(key: _sectionKeys['Skills']),

                // Experience section
                ExperienceSection(key: _sectionKeys['Experience']),

                // Contact section
                ContactSection(key: _sectionKeys['Contact']),
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
              onSectionTap: _scrollToSection,
            ),
          ),
        ],
      ),
    );
  }
}
