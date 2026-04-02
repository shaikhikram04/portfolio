import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../theme/app_text_styles.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  static const List<_ExperienceData> _items = [
    _ExperienceData(
      role: 'Flutter Intern',
      companyLocation: 'Stimuler, Bangalore',
      type: 'On-site',
      period: 'Sept 2025 – Feb 2026',
      icon: Icons.work_outline_rounded,
      points: [
        'Contributing to a large-scale Flutter application with modular architecture and production-level code quality standards.',
        'Implemented and maintained features using Flutter with Firebase services including Authentication, Firestore, Remote Config, and Cloud Functions.',
        'Worked extensively with Provider for state management, ensuring predictable state flow and maintainable UI logic.',
        'Collaborated closely with senior engineers to debug complex issues, refactor legacy components, and improve app stability and performance.',
      ],
    ),
    _ExperienceData(
      role: 'Flutter Intern',
      companyLocation: 'Advance Mobility Pvt. Ltd., Mumbai',
      type: 'On-site',
      period: 'May 2025 – July 2025',
      icon: Icons.rocket_launch_outlined,
      points: [
        'Developed and optimized multiple Flutter screens and workflows for a mobility-focused application.',
        'Integrated RESTful APIs to enable real-time data synchronization between the mobile app and backend services.',
        'Participated in team-based development using Git, following version control and code review best practices.',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final metrics = _ExperienceMetrics.fromWidth(width);

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
                '// experience',
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
                    'Work ',
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
                      'Experience',
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
              SizedBox(height: metrics.timelineTopGap),
              ..._items.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                return _ExperienceTimelineItem(
                  data: item,
                  isLast: index == _items.length - 1,
                  metrics: metrics,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExperienceData {
  const _ExperienceData({
    required this.role,
    required this.companyLocation,
    required this.type,
    required this.period,
    required this.icon,
    required this.points,
  });

  final String role;
  final String companyLocation;
  final String type;
  final String period;
  final IconData icon;
  final List<String> points;
}

class _ExperienceMetrics {
  const _ExperienceMetrics({
    required this.horizontalPadding,
    required this.sectionTopPadding,
    required this.sectionBottomPadding,
    required this.sectionLabelSize,
    required this.titleSize,
    required this.timelineTopGap,
    required this.timelineColumnWidth,
    required this.timelineIconSize,
    required this.timelineIconInnerSize,
    required this.timelineGap,
    required this.cardPadding,
    required this.cardBottomGap,
    required this.roleSize,
    required this.metaSize,
    required this.dateSize,
    required this.pointSize,
    required this.isMobile,
  });

  final double horizontalPadding;
  final double sectionTopPadding;
  final double sectionBottomPadding;
  final double sectionLabelSize;
  final double titleSize;
  final double timelineTopGap;
  final double timelineColumnWidth;
  final double timelineIconSize;
  final double timelineIconInnerSize;
  final double timelineGap;
  final EdgeInsets cardPadding;
  final double cardBottomGap;
  final double roleSize;
  final double metaSize;
  final double dateSize;
  final double pointSize;
  final bool isMobile;

  static _ExperienceMetrics fromWidth(double width) {
    if (width < 760) {
      return const _ExperienceMetrics(
        horizontalPadding: 18,
        sectionTopPadding: 72,
        sectionBottomPadding: 96,
        sectionLabelSize: 14,
        titleSize: 26,
        timelineTopGap: 28,
        timelineColumnWidth: 56,
        timelineIconSize: 42,
        timelineIconInnerSize: 18,
        timelineGap: 12,
        cardPadding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        cardBottomGap: 22,
        roleSize: 18,
        metaSize: 14,
        dateSize: 13,
        pointSize: 14,
        isMobile: true,
      );
    }

    if (width < 1024) {
      return const _ExperienceMetrics(
        horizontalPadding: 24,
        sectionTopPadding: 80,
        sectionBottomPadding: 96,
        sectionLabelSize: 14,
        titleSize: 30,
        timelineTopGap: 32,
        timelineColumnWidth: 62,
        timelineIconSize: 46,
        timelineIconInnerSize: 19,
        timelineGap: 14,
        cardPadding: EdgeInsets.fromLTRB(22, 22, 22, 22),
        cardBottomGap: 26,
        roleSize: 20,
        metaSize: 14,
        dateSize: 14,
        pointSize: 14,
        isMobile: false,
      );
    }

    return const _ExperienceMetrics(
      horizontalPadding: 32,
      sectionTopPadding: 88,
      sectionBottomPadding: 108,
      sectionLabelSize: 15,
      titleSize: 32,
      timelineTopGap: 36,
      timelineColumnWidth: 74,
      timelineIconSize: 46,
      timelineIconInnerSize: 20,
      timelineGap: 16,
      cardPadding: EdgeInsets.fromLTRB(22, 22, 22, 22),
      cardBottomGap: 28,
      roleSize: 20,
      metaSize: 14,
      dateSize: 14,
      pointSize: 14,
      isMobile: false,
    );
  }
}

class _ExperienceTimelineItem extends StatelessWidget {
  const _ExperienceTimelineItem({
    required this.data,
    required this.isLast,
    required this.metrics,
  });

  final _ExperienceData data;
  final bool isLast;
  final _ExperienceMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: metrics.timelineColumnWidth,
            child: Column(
              children: [
                _TimelineIcon(data: data, metrics: metrics),

                const SizedBox(height: 8),
                Expanded(
                  child: Container(
                    width: 1.4,
                    color: AppColors.primary.withValues(alpha: 0.24),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: metrics.timelineGap),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ExperienceCard(data: data, metrics: metrics),
                if (!isLast) SizedBox(height: metrics.cardBottomGap),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineIcon extends StatelessWidget {
  const _TimelineIcon({required this.data, required this.metrics});

  final _ExperienceData data;
  final _ExperienceMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: metrics.timelineIconSize,
      height: metrics.timelineIconSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary.withValues(alpha: 0.05),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.48)),
      ),
      child: Icon(
        data.icon,
        size: metrics.timelineIconInnerSize,
        color: AppColors.primary.withValues(alpha: 0.95),
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard({required this.data, required this.metrics});

  final _ExperienceData data;
  final _ExperienceMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: metrics.cardPadding,
      decoration: BoxDecoration(
        color: AppColors.card.withValues(alpha: 0.78),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (metrics.isMobile)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.role,
                  style: AppTextStyles.heroHeadingBase.copyWith(
                    fontSize: metrics.roleSize,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.4,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 8),
                _CompanyMeta(data: data, metrics: metrics),
                const SizedBox(height: 10),
                _DateMeta(data: data, metrics: metrics),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.role,
                        style: AppTextStyles.heroHeadingBase.copyWith(
                          fontSize: metrics.roleSize,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _CompanyMeta(data: data, metrics: metrics),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                _DateMeta(data: data, metrics: metrics),
              ],
            ),
          SizedBox(height: metrics.isMobile ? 14 : 16),
          ...data.points.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      size: metrics.pointSize - 1,
                      color: AppColors.primary.withValues(alpha: 0.9),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      point,
                      style: AppTextStyles.bodyDescription.copyWith(
                        fontSize: metrics.pointSize,
                        color: AppColors.textMuted.withValues(alpha: 0.92),
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CompanyMeta extends StatelessWidget {
  const _CompanyMeta({required this.data, required this.metrics});

  final _ExperienceData data;
  final _ExperienceMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          data.companyLocation,
          style: AppTextStyles.subtitleBase.copyWith(
            fontSize: metrics.metaSize,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary.withValues(alpha: 0.7),
            height: 1.3,
          ),
        ),
        Text(
          '◉ ${data.type}',
          style: AppTextStyles.badge.copyWith(
            fontSize: metrics.metaSize - 2,
            letterSpacing: 0.2,
            color: AppColors.textMuted.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }
}

class _DateMeta extends StatelessWidget {
  const _DateMeta({required this.data, required this.metrics});

  final _ExperienceData data;
  final _ExperienceMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.calendar_today_outlined,
          size: metrics.dateSize,
          color: AppColors.primary.withValues(alpha: 0.8),
        ),
        const SizedBox(width: 6),
        Text(
          data.period,
          style: AppTextStyles.badge.copyWith(
            fontSize: metrics.dateSize,
            color: AppColors.primary.withValues(alpha: 0.8),
            letterSpacing: 0.15,
          ),
        ),
      ],
    );
  }
}
