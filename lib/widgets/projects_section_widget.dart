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
    final isMobile = width < 980;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        0,
        isMobile ? 44 : 64,
        0,
        isMobile ? 48 : 68,
      ),
      child: Stack(
        children: [
          const Positioned.fill(child: _SectionBackdrop()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 18 : 32),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1152),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: isMobile ? 32 : 64),
                    Text(
                      '// projects',
                      style: AppTextStyles.badge.copyWith(
                        fontSize: isMobile ? 13 : 14,
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
                            fontSize: isMobile ? 40 : 32,
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
                              fontSize: isMobile ? 40 : 32,
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
                        fontSize: isMobile ? 22 * 0.7 : 24 * 0.7,
                        color: AppColors.textMuted,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: isMobile ? 56 : 80),
                    ..._projects.asMap().entries.map((entry) {
                      final index = entry.key;
                      final project = entry.value;
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index == _projects.length - 1
                              ? 0
                              : (isMobile ? 76 : 96),
                        ),
                        child: _ProjectRow(project: project),
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
  const _ProjectRow({required this.project});

  final _ProjectData project;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 980;

    final phone = _ProjectPhoneCard(title: project.title);
    final details = _ProjectDetails(project: project);

    if (isMobile) {
      return Column(
        children: [
          if (project.isPhoneFirst) ...[
            phone,
            const SizedBox(height: 28),
            details,
          ] else ...[
            details,
            const SizedBox(height: 28),
            phone,
          ],
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: project.isPhoneFirst
          ? [
              Expanded(flex: 5, child: phone),
              const SizedBox(width: 64),
              Expanded(flex: 6, child: details),
            ]
          : [
              Expanded(flex: 6, child: details),
              const SizedBox(width: 64),
              Expanded(flex: 5, child: phone),
            ],
    );
  }
}

class _ProjectDetails extends StatelessWidget {
  const _ProjectDetails({required this.project});

  final _ProjectData project;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 980;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.order,
          style: AppTextStyles.badge.copyWith(
            fontSize: isMobile ? 14 : 16,
            color: AppColors.primary.withValues(alpha: 0.9),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          project.title,
          style: AppTextStyles.heroHeadingBase.copyWith(
            fontSize: isMobile ? 42 * 0.7 : 54 * 0.7,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          project.description,
          style: AppTextStyles.bodyDescription.copyWith(
            fontSize: isMobile ? 23 * 0.7 : 24 * 0.7,
            color: AppColors.textMuted,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: project.tags.map((tag) => _TechChip(label: tag)).toList(),
        ),
        const SizedBox(height: 22),
        Wrap(
          spacing: 14,
          runSpacing: 12,
          children: const [
            _ActionButton(
              label: 'Source Code',
              icon: FontAwesomeIcons.github,
              filled: false,
            ),
            _ActionButton(
              label: 'Live Demo',
              icon: Icons.open_in_new_rounded,
              filled: true,
            ),
          ],
        ),
      ],
    );
  }
}

class _ProjectPhoneCard extends StatelessWidget {
  const _ProjectPhoneCard({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 980;

    final cardW = isMobile ? 230.0 : 260.0;
    final cardH = isMobile ? 470.0 : 520.0;

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
  const _TechChip({required this.label});

  final String label;

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
          fontSize: 13,
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
  });

  final String label;
  final IconData icon;
  final bool filled;

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
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
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
