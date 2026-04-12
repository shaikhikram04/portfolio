import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ikram_portfolio/app/theme/app_text_styles.dart';
import 'package:ikram_portfolio/core/constants/app_colors.dart';
import 'package:ikram_portfolio/common/widgets/section_card_widget.dart';
import 'package:ikram_portfolio/common/widgets/section_header_widget.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const List<_SkillGroupData> _groups = [
    _SkillGroupData(
      title: 'MOBILE DEVELOPMENT',
      skills: [
        _SkillData(
          label: 'Flutter',
          assetPath: 'assets/icons/flutter.svg',
          iconBackground: Color(0x1A0D99FF),
        ),
        _SkillData(
          label: 'Dart',
          assetPath: 'assets/icons/dart.svg',
          iconBackground: Color(0x1A0075C4),
        ),
        _SkillData(
          label: 'Provider',
          assetPath: 'assets/icons/dart.svg',
          iconBackground: Color(0x1A0075C4),
        ),
        _SkillData(
          label: 'GetX',
          assetPath: 'assets/icons/getx.png',
          iconBackground: Color(0x1A6B4CEB),
        ),
        _SkillData(
          label: 'Riverpod',
          assetPath: 'assets/icons/riverpod.svg',
          iconBackground: Color(0x1A0075C4),
        ),
        _SkillData(
          label: 'BLoC',
          assetPath: 'assets/icons/bloc.svg',
          iconBackground: Color(0x1A00A5A2),
        ),
      ],
    ),
    _SkillGroupData(
      title: 'BACKEND & APIS',
      skills: [
        _SkillData(
          label: 'Firebase',
          assetPath: 'assets/icons/firebase.svg',
          iconBackground: Color(0x18FFB300),
        ),
        _SkillData(
          label: 'Supabase',
          assetPath: 'assets/icons/supabase.svg',
          iconBackground: Color(0x151AE5B6),
        ),
        _SkillData(
          label: 'REST APIs',
          assetPath: 'assets/icons/api.svg',
          iconBackground: Color(0x24AEB6C2),
        ),
      ],
    ),
    _SkillGroupData(
      title: 'TOOLS & PLATFORMS',
      skills: [
        _SkillData(
          label: 'Git',
          assetPath: 'assets/icons/git.svg',
          iconBackground: Color(0x17F04F33),
        ),
        _SkillData(
          label: 'VS Code',
          assetPath: 'assets/icons/Visual_Studio_Code.svg',
          iconBackground: Color(0x1A007ACC),
        ),
        _SkillData(
          label: 'GitHub',
          assetPath: 'assets/icons/github.svg',
          iconBackground: Color(0x24AEB6C2),
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
              SectionHeader(
                badgeText: '// skills',
                leadingText: 'Tech ',
                highlightedText: 'Stack',
                badgeBottomSpacing: 10,
                badgeStyle: AppTextStyles.badge.copyWith(
                  fontSize: metrics.sectionLabelSize,
                  color: AppColors.primary.withValues(alpha: 0.95),
                ),
                leadingStyle: AppTextStyles.heroHeadingBase.copyWith(
                  fontSize: metrics.titleSize,
                  fontWeight: FontWeight.w700,
                  height: 1.06,
                  letterSpacing: -0.8,
                ),
                highlightedStyle: AppTextStyles.heroHeadingGradient.copyWith(
                  fontSize: metrics.titleSize,
                  fontWeight: FontWeight.w700,
                  height: 1.06,
                  letterSpacing: -0.8,
                ),
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
        skillGridSpacing: 24,
        cardHeight: 120,
        cardPadding: EdgeInsets.fromLTRB(18, 16, 18, 16),
        iconBoxSize: 46,
        iconSize: 18,
        skillLabelSize: 16,
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
        skillGridSpacing: 24,
        cardHeight: 120,
        cardPadding: EdgeInsets.fromLTRB(18, 16, 18, 16),
        iconBoxSize: 46,
        iconSize: 18,
        skillLabelSize: 16,
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
      skillGridSpacing: 24,
      cardHeight: 120,
      cardPadding: EdgeInsets.fromLTRB(18, 16, 18, 16),
      iconBoxSize: 46,
      iconSize: 18,
      skillLabelSize: 16,
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
    required this.assetPath,
    this.iconBackground,
  });

  final String label;
  final String assetPath;
  final Color? iconBackground;
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
            final columns = _columnsFor(maxWidth);
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

  int _columnsFor(double width) {
    if (width >= 1220) {
      return 4;
    }
    if (width >= 960) {
      return 4;
    }
    if (width >= 680) {
      return 3;
    }
    return 2;
  }
}

class _SkillCard extends StatefulWidget {
  const _SkillCard({required this.skill, required this.metrics});

  final _SkillData skill;
  final _SkillsSectionMetrics metrics;

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final normalBorder = AppColors.border.withValues(alpha: 0.8);
    final hoverBorder = AppColors.primary.withValues(alpha: 0.42);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TweenAnimationBuilder<Color?>(
        tween: ColorTween(
          begin: normalBorder,
          end: _isHovered ? hoverBorder : normalBorder,
        ),
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        builder: (context, borderColor, _) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOutCubic,
            transform: Matrix4.translationValues(0, _isHovered ? -6 : 0, 0),
            child: SectionCard(
              height: widget.metrics.cardHeight,
              padding: widget.metrics.cardPadding,
              borderRadius: BorderRadius.circular(12),
              backgroundColor: AppColors.card.withValues(alpha: 0.78),
              borderColor: borderColor ?? normalBorder,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: widget.metrics.iconBoxSize,
                    height: widget.metrics.iconBoxSize,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color:
                          widget.skill.iconBackground ??
                          AppColors.primary.withValues(alpha: 0.12),
                    ),
                    child: _SkillAssetIcon(assetPath: widget.skill.assetPath),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.skill.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.navLink.copyWith(
                      fontSize: widget.metrics.skillLabelSize,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary.withValues(alpha: 0.92),
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SkillAssetIcon extends StatelessWidget {
  const _SkillAssetIcon({required this.assetPath});

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    if (assetPath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(assetPath, fit: BoxFit.contain);
    }

    return Image.asset(assetPath, fit: BoxFit.contain);
  }
}
