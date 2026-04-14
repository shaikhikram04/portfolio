import 'package:flutter/material.dart';
import 'package:ikram_portfolio/core/constants/app_colors.dart';
import 'package:ikram_portfolio/features/home/home_sections.dart';
import 'package:ikram_portfolio/features/home/presentation/widgets/about_developer_section_widget.dart';
import 'package:ikram_portfolio/features/home/presentation/widgets/background_decorations_widget.dart';
import 'package:ikram_portfolio/features/home/presentation/widgets/contact_section_widget.dart';
import 'package:ikram_portfolio/features/home/presentation/widgets/experience_section_widget.dart';
import 'package:ikram_portfolio/features/home/presentation/widgets/hero_section_widget.dart';
import 'package:ikram_portfolio/features/home/presentation/widgets/navbar_widget.dart';
import 'package:ikram_portfolio/features/home/presentation/widgets/projects_section_widget.dart';
import 'package:ikram_portfolio/features/home/presentation/widgets/skills_section_widget.dart';

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
  late final Map<String, bool> _revealedSections;
  bool _hasScrolled = false;
  bool _heroVisible = false;

  @override
  void initState() {
    super.initState();
    _sectionKeys = {
      HomeSections.home: GlobalKey(),
      HomeSections.about: GlobalKey(),
      HomeSections.projects: GlobalKey(),
      HomeSections.skills: GlobalKey(),
      HomeSections.experience: GlobalKey(),
      HomeSections.contact: GlobalKey(),
    };
    _revealedSections = {
      HomeSections.about: false,
      HomeSections.projects: false,
      HomeSections.skills: false,
      HomeSections.experience: false,
      HomeSections.contact: false,
    };
    _scrollController = ScrollController()..addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() => _heroVisible = true);
      _updateRevealedSections();
    });
  }

  void _scrollToSection(String section) {
    if (!_scrollController.hasClients) return;

    if (section == HomeSections.home) {
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

    _updateRevealedSections();
  }

  void _updateRevealedSections() {
    if (!mounted) return;

    final viewportHeight = MediaQuery.sizeOf(context).height;
    bool changed = false;

    for (final section in _revealedSections.keys) {
      if (_revealedSections[section] == true) continue;

      final key = _sectionKeys[section];
      if (key == null) continue;

      if (_isSectionInRevealRange(key, viewportHeight)) {
        _revealedSections[section] = true;
        changed = true;
      }
    }

    if (changed) {
      setState(() {});
    }
  }

  bool _isSectionInRevealRange(GlobalKey key, double viewportHeight) {
    final targetContext = key.currentContext;
    if (targetContext == null) return false;

    final renderBox = targetContext.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.hasSize) return false;

    final sectionTop = renderBox.localToGlobal(Offset.zero).dy;
    final revealThreshold = viewportHeight * 0.88;

    return sectionTop <= revealThreshold;
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
        activeSection: HomeSections.home,
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
                  key: _sectionKeys[HomeSections.home],
                  height: viewportHeight,
                  child: Stack(
                    children: [
                      const Positioned.fill(child: BackgroundDecorations()),
                      Column(
                        children: [
                          const SizedBox(height: _navBarHeight),
                          Expanded(
                            child: _AnimatedSectionReveal(
                              visible: _heroVisible,
                              beginOffset: const Offset(0, 0.06),
                              duration: const Duration(milliseconds: 700),
                              child: HeroSection(
                                onViewProjectsTap: () =>
                                    _scrollToSection(HomeSections.projects),
                                onContactMeTap: () =>
                                    _scrollToSection(HomeSections.contact),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // About / developer profile section
                _AnimatedSectionReveal(
                  visible: _revealedSections[HomeSections.about] ?? false,
                  child: AboutDeveloperSection(
                    key: _sectionKeys[HomeSections.about],
                  ),
                ),

                // Projects showcase section
                _AnimatedSectionReveal(
                  visible: _revealedSections[HomeSections.projects] ?? false,
                  child: ProjectsSection(
                    key: _sectionKeys[HomeSections.projects],
                  ),
                ),

                // Skills section
                _AnimatedSectionReveal(
                  visible: _revealedSections[HomeSections.skills] ?? false,
                  child: SkillsSection(key: _sectionKeys[HomeSections.skills]),
                ),

                // Experience section
                _AnimatedSectionReveal(
                  visible: _revealedSections[HomeSections.experience] ?? false,
                  child: ExperienceSection(
                    key: _sectionKeys[HomeSections.experience],
                  ),
                ),

                // Contact section
                _AnimatedSectionReveal(
                  visible: _revealedSections[HomeSections.contact] ?? false,
                  child: ContactSection(
                    key: _sectionKeys[HomeSections.contact],
                  ),
                ),
              ],
            ),
          ),

          // Sticky top navigation with blur-on-scroll
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PortfolioNavBar(
              activeSection: HomeSections.home,
              isScrolled: _hasScrolled,
              onSectionTap: _scrollToSection,
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedSectionReveal extends StatelessWidget {
  const _AnimatedSectionReveal({
    required this.visible,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.beginOffset = const Offset(0, 0.08),
  });

  final bool visible;
  final Widget child;
  final Duration duration;
  final Offset beginOffset;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: duration,
      curve: Curves.easeOutCubic,
      offset: visible ? Offset.zero : beginOffset,
      child: AnimatedOpacity(
        duration: duration,
        curve: Curves.easeOutCubic,
        opacity: visible ? 1 : 0,
        child: child,
      ),
    );
  }
}
