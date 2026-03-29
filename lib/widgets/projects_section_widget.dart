import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/colors.dart';
import '../theme/app_text_styles.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const List<_ProjectData> _projects = [
    _ProjectData(
      order: '01 / 02',
      title: 'Tracket',
      description:
          'Cricket match management app with live scoring, player statistics, and team management. Real-time updates with seamless UX.',
      tags: ['Flutter', 'Dart', 'Firebase', 'Riverpod'],
      isPhoneFirst: true,
    ),
    _ProjectData(
      order: '02 / 02',
      title: 'Movie Recommendation App',
      description:
          'Track watched movies and get personalized recommendations based on your rankings. Beautiful UI with smart content discovery.',
      tags: ['Flutter', 'Dart', 'REST API', 'GetX'],
      isPhoneFirst: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final metrics = _ProjectsSectionMetrics.fromWidth(width);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        0,
        metrics.sectionTopPadding,
        0,
        metrics.sectionBottomPadding,
      ),
      child: Stack(
        children: [
          const Positioned.fill(child: _SectionBackdrop()),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: metrics.horizontalPadding,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1152),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: metrics.headingTopSpacing),
                    Text(
                      '// projects',
                      style: AppTextStyles.badge.copyWith(
                        fontSize: metrics.sectionLabelSize,
                        color: AppColors.primary.withValues(alpha: 0.95),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Featured ',
                          style: AppTextStyles.heroHeadingBase.copyWith(
                            fontSize: metrics.titleSize,
                            fontWeight: FontWeight.w400,
                            height: 1.06,
                            letterSpacing: -0.8,
                          ),
                        ),
                        ShaderMask(
                          shaderCallback: (bounds) =>
                              const LinearGradient(
                                colors: AppColors.primaryGradient,
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ).createShader(
                                Rect.fromLTWH(
                                  0,
                                  0,
                                  bounds.width,
                                  bounds.height,
                                ),
                              ),
                          blendMode: BlendMode.srcIn,
                          child: Text(
                            'Work',
                            style: AppTextStyles.heroHeadingGradient.copyWith(
                              fontSize: metrics.titleSize,
                              fontWeight: FontWeight.w400,
                              height: 1.06,
                              letterSpacing: -0.8,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "A showcase of apps I've built with passion and attention to detail.",
                      style: AppTextStyles.bodyDescription.copyWith(
                        fontSize: metrics.subtitleSize,
                        color: AppColors.textMuted,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: metrics.projectsTopGap),
                    ..._projects.asMap().entries.map((entry) {
                      final index = entry.key;
                      final project = entry.value;
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index == _projects.length - 1
                              ? 0
                              : metrics.projectBlockGap,
                        ),
                        child: _ProjectRow(project: project, metrics: metrics),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectsSectionMetrics {
  const _ProjectsSectionMetrics({
    required this.horizontalPadding,
    required this.sectionTopPadding,
    required this.sectionBottomPadding,
    required this.headingTopSpacing,
    required this.sectionLabelSize,
    required this.titleSize,
    required this.subtitleSize,
    required this.projectsTopGap,
    required this.projectBlockGap,
    required this.isMobile,
    required this.projectRowGap,
    required this.projectOrderSize,
    required this.projectTitleSize,
    required this.projectDescriptionSize,
    required this.phoneCardWidth,
    required this.phoneCardHeight,
    required this.techChipFontSize,
    required this.buttonHorizontalPadding,
    required this.buttonVerticalPadding,
    required this.buttonLabelSize,
  });

  final double horizontalPadding;
  final double sectionTopPadding;
  final double sectionBottomPadding;
  final double headingTopSpacing;
  final double sectionLabelSize;
  final double titleSize;
  final double subtitleSize;
  final double projectsTopGap;
  final double projectBlockGap;
  final bool isMobile;
  final double projectRowGap;
  final double projectOrderSize;
  final double projectTitleSize;
  final double projectDescriptionSize;
  final double phoneCardWidth;
  final double phoneCardHeight;
  final double techChipFontSize;
  final double buttonHorizontalPadding;
  final double buttonVerticalPadding;
  final double buttonLabelSize;

  static _ProjectsSectionMetrics fromWidth(double width) {
    final titleSize = _titleSizeFromWidth(width);

    if (width < 980) {
      return _ProjectsSectionMetrics(
        horizontalPadding: 18,
        sectionTopPadding: 44,
        sectionBottomPadding: 48,
        headingTopSpacing: 32,
        sectionLabelSize: 13,
        titleSize: titleSize,
        subtitleSize: 15.4,
        projectsTopGap: 56,
        projectBlockGap: 76,
        isMobile: true,
        projectRowGap: 28,
        projectOrderSize: 12,
        projectTitleSize: 28,
        projectDescriptionSize: 16.1,
        phoneCardWidth: 230,
        phoneCardHeight: 470,
        techChipFontSize: 13,
        buttonHorizontalPadding: 16,
        buttonVerticalPadding: 8,
        buttonLabelSize: 13,
      );
    }
    return _ProjectsSectionMetrics(
      horizontalPadding: 32,
      sectionTopPadding: 64,
      sectionBottomPadding: 68,
      headingTopSpacing: 64,
      sectionLabelSize: 14,
      titleSize: titleSize,
      subtitleSize: 16.8,
      projectsTopGap: 80,
      projectBlockGap: 96,
      isMobile: false,
      projectRowGap: 64,
      projectOrderSize: 14,
      projectTitleSize: 32,
      projectDescriptionSize: 16.8,
      phoneCardWidth: 260,
      phoneCardHeight: 520,
      techChipFontSize: 13,
      buttonHorizontalPadding: 18,
      buttonVerticalPadding: 10,
      buttonLabelSize: 14,
    );
  }

  static double _titleSizeFromWidth(double width) {
    if (width < 640) {
      return 26;
    }
    if (width < 824) {
      return 30;
    }
    if (width < 1024) {
      return 30;
    }
    return 32;
  }
}

class _ProjectData {
  const _ProjectData({
    required this.order,
    required this.title,
    required this.description,
    required this.tags,
    required this.isPhoneFirst,
  });

  final String order;
  final String title;
  final String description;
  final List<String> tags;
  final bool isPhoneFirst;
}

class _ProjectRow extends StatelessWidget {
  const _ProjectRow({required this.project, required this.metrics});

  final _ProjectData project;
  final _ProjectsSectionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    final phone = _ProjectPhoneCard(title: project.title, metrics: metrics);
    final details = _ProjectDetails(project: project, metrics: metrics);

    if (metrics.isMobile) {
      return Column(
        children: [
          phone,
          SizedBox(height: metrics.projectRowGap),
          details,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: project.isPhoneFirst
          ? [
              Expanded(flex: 5, child: phone),
              SizedBox(width: metrics.projectRowGap),
              Expanded(flex: 6, child: details),
            ]
          : [
              Expanded(flex: 6, child: details),
              SizedBox(width: metrics.projectRowGap),
              Expanded(flex: 5, child: phone),
            ],
    );
  }
}

class _ProjectDetails extends StatelessWidget {
  const _ProjectDetails({required this.project, required this.metrics});

  final _ProjectData project;
  final _ProjectsSectionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.order,
          style: AppTextStyles.badge.copyWith(
            fontSize: metrics.projectOrderSize,
            color: AppColors.primary.withValues(alpha: 0.9),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          project.title,
          style: AppTextStyles.heroHeadingBase.copyWith(
            fontSize: metrics.projectTitleSize,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          project.description,
          style: AppTextStyles.bodyDescription.copyWith(
            fontSize: metrics.projectDescriptionSize,
            color: AppColors.textMuted,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: project.tags
              .map((tag) => _TechChip(label: tag, metrics: metrics))
              .toList(),
        ),
        const SizedBox(height: 22),
        Wrap(
          spacing: 14,
          runSpacing: 12,
          children: [
            _ActionButton(
              label: 'Source Code',
              icon: FontAwesomeIcons.github,
              filled: false,
              metrics: metrics,
            ),
            _ActionButton(
              label: 'Live Demo',
              icon: Icons.open_in_new_rounded,
              filled: true,
              metrics: metrics,
            ),
          ],
        ),
      ],
    );
  }
}

class _ProjectPhoneCard extends StatelessWidget {
  const _ProjectPhoneCard({required this.title, required this.metrics});

  final String title;
  final _ProjectsSectionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    final cardW = metrics.phoneCardWidth;
    final cardH = metrics.phoneCardHeight;

    return SizedBox(
      height: cardH + 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: cardW + 180,
            height: cardH + 180,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.20),
                  AppColors.accent.withValues(alpha: 0.16),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.42, 1],
              ),
            ),
          ),
          Container(
            width: cardW,
            height: cardH,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              color: AppColors.surface.withValues(alpha: 0.94),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.06),
                width: 1.2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: AppColors.secondary.withValues(alpha: 0.78),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.04),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Container(
                      width: 76,
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppColors.background.withValues(alpha: 0.82),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    const SizedBox(height: 72),
                    Icon(
                      Icons.phone_android_rounded,
                      color: AppColors.primary,
                      size: 30,
                    ),
                    const SizedBox(height: 14),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.subtitleAnimated.copyWith(
                        fontSize: 38 * 0.7,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary.withValues(alpha: 0.92),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 26),
                    _line(width: 130),
                    const SizedBox(height: 9),
                    _line(width: 112),
                    const SizedBox(height: 9),
                    _line(width: 86),
                    const SizedBox(height: 34),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _dot(AppColors.primary.withValues(alpha: 0.35)),
                        const SizedBox(width: 10),
                        _dot(AppColors.accent.withValues(alpha: 0.35)),
                        const SizedBox(width: 10),
                        _dot(AppColors.primary.withValues(alpha: 0.32)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _line({required double width}) {
    return Container(
      width: width,
      height: 7,
      decoration: BoxDecoration(
        color: AppColors.border.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _dot(Color color) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(11),
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  const _TechChip({required this.label, required this.metrics});

  final String label;
  final _ProjectsSectionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.30),
          width: 1,
        ),
        color: AppColors.background.withValues(alpha: 0.16),
      ),
      child: Text(
        label,
        style: AppTextStyles.badge.copyWith(
          fontSize: metrics.techChipFontSize,
          color: AppColors.primary.withValues(alpha: 0.85),
        ),
      ),
    );
  }
}

class _ActionButton extends StatefulWidget {
  const _ActionButton({
    required this.label,
    required this.icon,
    required this.filled,
    required this.metrics,
  });

  final String label;
  final IconData icon;
  final bool filled;
  final _ProjectsSectionMetrics metrics;

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: EdgeInsets.symmetric(
            horizontal: widget.metrics.buttonHorizontalPadding,
            vertical: widget.metrics.buttonVerticalPadding,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: widget.filled
                ? LinearGradient(
                    colors: _hovered
                        ? AppColors.highlightGradient
                        : AppColors.primaryGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: _hovered ? const [0.25, 0.9] : const [0.2, 0.9],
                  )
                : null,
            color: widget.filled
                ? null
                : AppColors.secondary.withValues(alpha: 0.38),
            border: Border.all(
              color: widget.filled
                  ? Colors.transparent
                  : _hovered
                  ? AppColors.primary.withValues(alpha: 0.55)
                  : Colors.white.withValues(alpha: 0.11),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 15,
                color: widget.filled
                    ? AppColors.primaryForeground
                    : _hovered
                    ? AppColors.primary.withValues(alpha: 0.85)
                    : AppColors.secondaryForeground,
              ),
              const SizedBox(width: 10),
              Text(
                widget.label,
                style: AppTextStyles.buttonOutlined.copyWith(
                  fontSize: widget.metrics.buttonLabelSize,
                  fontWeight: FontWeight.w600,
                  color: widget.filled
                      ? AppColors.primaryForeground
                      : _hovered
                      ? AppColors.primary.withValues(alpha: 0.85)
                      : AppColors.secondaryForeground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionBackdrop extends StatelessWidget {
  const _SectionBackdrop();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.0, -1.5),
                  radius: 1,
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
          // Positioned.fill(child: CustomPaint(painter: _VerticalBandPainter())),
        ],
      ),
    );
  }
}
