import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../theme/app_text_styles.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const List<_SkillGroupData> _groups = [
    _SkillGroupData(
      title: 'MOBILE DEVELOPMENT',
      skills: [
        _SkillData(
          label: 'Flutter',
          value: 75,
          icon: Icons.phone_android_rounded,
        ),
        _SkillData(label: 'Dart', value: 80, icon: Icons.code_rounded),
        _SkillData(
          label: 'State Management',
          value: 70,
          icon: Icons.view_agenda_rounded,
        ),
      ],
    ),
    _SkillGroupData(
      title: 'BACKEND & APIS',
      skills: [
        _SkillData(label: 'Firebase', value: 80, icon: Icons.flash_on_rounded),
        _SkillData(label: 'Supabase', value: 70, icon: Icons.storage_rounded),
        _SkillData(label: 'Node.js', value: 40, icon: Icons.memory_rounded),
        _SkillData(label: 'REST APIs', value: 70, icon: Icons.language_rounded),
      ],
    ),
    _SkillGroupData(
      title: 'TOOLS',
      skills: [
        _SkillData(label: 'Git', value: 80, icon: Icons.alt_route_rounded),
        _SkillData(
          label: 'AI Coding Tools',
          value: 75,
          icon: Icons.smart_toy_rounded,
        ),
        _SkillData(
          label: 'Localization',
          value: 80,
          icon: Icons.translate_rounded,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final metrics = _SkillsSectionMetrics.fromWidth(width);

    return Padding(
      padding: EdgeInsets.fromLTRB(
        metrics.horizontalPadding,
        metrics.sectionTopPadding,
        metrics.horizontalPadding,
        metrics.sectionBottomPadding,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1152),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '// skills',
                style: AppTextStyles.badge.copyWith(
                  fontSize: metrics.sectionLabelSize,
                  color: AppColors.primary.withValues(alpha: 0.95),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Tech ',
                    style: AppTextStyles.heroHeadingBase.copyWith(
                      fontSize: metrics.titleSize,
                      fontWeight: FontWeight.w700,
                      height: 1.06,
                      letterSpacing: -0.8,
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        LinearGradient(
                          colors: AppColors.primaryGradient,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                    blendMode: BlendMode.srcIn,
                    child: Text(
                      'Stack',
                      style: AppTextStyles.heroHeadingGradient.copyWith(
                        fontSize: metrics.titleSize,
                        fontWeight: FontWeight.w700,
                        height: 1.06,
                        letterSpacing: -0.8,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: metrics.groupsTopGap),
              ..._groups.map(
                (group) => Padding(
                  padding: EdgeInsets.only(bottom: metrics.groupBottomGap),
                  child: _SkillGroup(group: group, metrics: metrics),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillsSectionMetrics {
  const _SkillsSectionMetrics({
    required this.horizontalPadding,
    required this.sectionTopPadding,
    required this.sectionBottomPadding,
    required this.sectionLabelSize,
    required this.titleSize,
    required this.groupsTopGap,
    required this.groupBottomGap,
    required this.groupTitleSize,
    required this.groupTitleSpacing,
    required this.skillGridSpacing,
    required this.cardHeight,
    required this.cardPadding,
    required this.iconBoxSize,
    required this.iconSize,
    required this.skillLabelSize,
    required this.skillValueSize,
  });

  final double horizontalPadding;
  final double sectionTopPadding;
  final double sectionBottomPadding;
  final double sectionLabelSize;
  final double titleSize;
  final double groupsTopGap;
  final double groupBottomGap;
  final double groupTitleSize;
  final double groupTitleSpacing;
  final double skillGridSpacing;
  final double cardHeight;
  final EdgeInsets cardPadding;
  final double iconBoxSize;
  final double iconSize;
  final double skillLabelSize;
  final double skillValueSize;

  static _SkillsSectionMetrics fromWidth(double width) {
    final titleSize = _titleSizeFromWidth(width);

    if (width < 760) {
      return _SkillsSectionMetrics(
        horizontalPadding: 18,
        sectionTopPadding: 72,
        sectionBottomPadding: 84,
        sectionLabelSize: 14,
        titleSize: titleSize,
        groupsTopGap: 26,
        groupBottomGap: 34,
        groupTitleSize: 14,
        groupTitleSpacing: 14,
        skillGridSpacing: 16,
        cardHeight: 100,
        cardPadding: EdgeInsets.fromLTRB(18, 16, 18, 14),
        iconBoxSize: 38,
        iconSize: 18,
        skillLabelSize: 20,
        skillValueSize: 12.6,
      );
    }
    if (width < 980) {
      return _SkillsSectionMetrics(
        horizontalPadding: 18,
        sectionTopPadding: 88,
        sectionBottomPadding: 96,
        sectionLabelSize: 15,
        titleSize: titleSize,
        groupsTopGap: 34,
        groupBottomGap: 34,
        groupTitleSize: 14,
        groupTitleSpacing: 14,
        skillGridSpacing: 16,
        cardHeight: 100,
        cardPadding: EdgeInsets.fromLTRB(18, 16, 18, 14),
        iconBoxSize: 38,
        iconSize: 18,
        skillLabelSize: 20,
        skillValueSize: 12.6,
      );
    }
    return _SkillsSectionMetrics(
      horizontalPadding: 32,
      sectionTopPadding: 88,
      sectionBottomPadding: 96,
      sectionLabelSize: 15,
      titleSize: titleSize,
      groupsTopGap: 34,
      groupBottomGap: 34,
      groupTitleSize: 14,
      groupTitleSpacing: 14,
      skillGridSpacing: 16,
      cardHeight: 100,
      cardPadding: EdgeInsets.fromLTRB(18, 16, 18, 14),
      iconBoxSize: 38,
      iconSize: 18,
      skillLabelSize: 20,
      skillValueSize: 12.6,
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

class _SkillGroupData {
  const _SkillGroupData({required this.title, required this.skills});

  final String title;
  final List<_SkillData> skills;
}

class _SkillData {
  const _SkillData({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final int value;
  final IconData icon;
}

class _SkillGroup extends StatelessWidget {
  const _SkillGroup({required this.group, required this.metrics});

  final _SkillGroupData group;
  final _SkillsSectionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          group.title,
          style: AppTextStyles.badge.copyWith(
            fontSize: metrics.groupTitleSize,
            color: AppColors.textMuted.withValues(alpha: 0.9),
            letterSpacing: 1.1,
          ),
        ),
        SizedBox(height: metrics.groupTitleSpacing),
        LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            final columns = maxWidth >= 1060
                ? 3
                : maxWidth >= 700
                ? 2
                : 1;
            final spacing = metrics.skillGridSpacing;
            final cardWidth = columns == 1
                ? maxWidth
                : (maxWidth - (spacing * (columns - 1))) / columns;

            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: group.skills
                  .map(
                    (skill) => SizedBox(
                      width: cardWidth,
                      child: _SkillCard(skill: skill, metrics: metrics),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}

class _SkillCard extends StatelessWidget {
  const _SkillCard({required this.skill, required this.metrics});

  final _SkillData skill;
  final _SkillsSectionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    final fill = skill.value / 100;
    final clampedFill = fill.clamp(0, 1).toDouble();

    return Container(
      height: metrics.cardHeight,
      padding: metrics.cardPadding,
      decoration: BoxDecoration(
        color: AppColors.card.withValues(alpha: 0.78),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.8)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: metrics.iconBoxSize,
                height: metrics.iconBoxSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primary.withValues(alpha: 0.12),
                ),
                child: Icon(
                  skill.icon,
                  size: metrics.iconSize,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      skill.label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.subtitleBase.copyWith(
                        fontSize: metrics.skillLabelSize,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary.withValues(alpha: 0.92),
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${skill.value}%',
                      style: AppTextStyles.navLink.copyWith(
                        fontSize: metrics.skillValueSize,
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w600,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 12,
            child: LayoutBuilder(
              builder: (context, constraints) {
                const bubbleSize = 10.0;
                final bubbleLeft =
                    (constraints.maxWidth * clampedFill - (bubbleSize / 2))
                        .clamp(0.0, constraints.maxWidth - bubbleSize);

                return Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerLeft,
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 2,
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: AppColors.secondary.withValues(alpha: 0.72),
                          border: Border.all(
                            color: AppColors.border.withValues(alpha: 0.95),
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(999),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: FractionallySizedBox(
                              widthFactor: clampedFill,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: AppColors.primaryGradient,
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: bubbleLeft,
                      top: 1,
                      child: Container(
                        width: bubbleSize,
                        height: bubbleSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: AppColors.primaryGradient,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: Border.all(
                            color: AppColors.primaryForeground.withValues(
                              alpha: 0.6,
                            ),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.35),
                              blurRadius: 8,
                              spreadRadius: 0.5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
