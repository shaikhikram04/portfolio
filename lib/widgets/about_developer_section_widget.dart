import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../theme/app_text_styles.dart';

class AboutDeveloperSection extends StatelessWidget {
  const AboutDeveloperSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final metrics = _SectionMetrics.fromWidth(width);

    return Padding(
      padding: EdgeInsets.fromLTRB(
        metrics.horizontalPadding,
        96,
        metrics.horizontalPadding,
        96,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1152),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '// about me',
                style: AppTextStyles.badge.copyWith(
                  fontSize: metrics.aboutLabelSize,
                  color: AppColors.primary.withValues(alpha: 0.95),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Developer ',
                    style: AppTextStyles.heroHeadingBase.copyWith(
                      fontSize: metrics.titleSize,
                      height: 1.18,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        const LinearGradient(
                          colors: AppColors.primaryGradient,
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                    blendMode: BlendMode.srcIn,
                    child: Text(
                      'Profile',
                      style: AppTextStyles.heroHeadingGradient.copyWith(
                        fontSize: metrics.titleSize,
                        height: 1.18,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: metrics.blockGap),
              if (metrics.isMobile)
                Column(
                  children: [
                    _TerminalCard(metrics: metrics),
                    const SizedBox(height: 16),
                    _StatsAndToolsPanel(metrics: metrics),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: _TerminalCard(metrics: metrics)),
                    const SizedBox(width: 22),
                    Expanded(
                      flex: 3,
                      child: _StatsAndToolsPanel(metrics: metrics),
                    ),
                  ],
                ),
              const SizedBox(height: 18),
              _TechStackCard(metrics: metrics),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionMetrics {
  const _SectionMetrics({
    required this.horizontalPadding,
    required this.titleSize,
    required this.aboutLabelSize,
    required this.blockGap,
    required this.statTitleSize,
    required this.statValueSize,
    required this.isMobile,
  });

  final double horizontalPadding;
  final double titleSize;
  final double aboutLabelSize;
  final double blockGap;
  final double statTitleSize;
  final double statValueSize;
  final bool isMobile;

  static _SectionMetrics fromWidth(double width) {
    if (width < 640) {
      return const _SectionMetrics(
        horizontalPadding: 16,
        titleSize: 26,
        aboutLabelSize: 14,
        blockGap: 20,
        statTitleSize: 10,
        statValueSize: 14,
        isMobile: true,
      );
    }
    if (width < 824) {
      return const _SectionMetrics(
        horizontalPadding: 24,
        titleSize: 30,
        aboutLabelSize: 14,
        blockGap: 22,
        statTitleSize: 12,
        statValueSize: 15,
        isMobile: true,
      );
    }
    if (width < 1024) {
      return const _SectionMetrics(
        horizontalPadding: 24,
        titleSize: 30,
        aboutLabelSize: 14,
        blockGap: 22,
        statTitleSize: 12,
        statValueSize: 15,
        isMobile: false,
      );
    }
    return const _SectionMetrics(
      horizontalPadding: 32,
      titleSize: 32,
      aboutLabelSize: 14,
      blockGap: 24,
      statTitleSize: 12,
      statValueSize: 16,
      isMobile: false,
    );
  }
}

class _TerminalCard extends StatelessWidget {
  const _TerminalCard({required this.metrics});

  final _SectionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    final cardRadius = BorderRadius.circular(12);
    final mono = GoogleFonts.jetBrainsMono(
      color: AppColors.secondaryForeground,
      fontSize: metrics.isMobile ? 12 : 14,
      height: 1.85,
      letterSpacing: 0.15,
    );

    return _GlassCard(
      borderRadius: cardRadius,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              color: AppColors.secondary.withValues(alpha: 0.50),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const _Dot(color: Color(0xFFE0584F)),
                  const SizedBox(width: 8),
                  const _Dot(color: Color(0xFFE4B652)),
                  const SizedBox(width: 8),
                  const _Dot(color: Color(0xFF49BE67)),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      '~/ikram-kolekar/profile',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.jetBrainsMono(
                        color: AppColors.textMuted,
                        fontSize: metrics.isMobile ? 11 : 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(width: double.infinity, height: 1, color: AppColors.border),
          Padding(
            padding: EdgeInsets.fromLTRB(
              18,
              18,
              18,
              metrics.isMobile ? 18 : 22,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: r'$ ',
                        style: mono.copyWith(
                          color: AppColors.primary.withValues(alpha: 0.92),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: 'cat developer.json',
                        style: mono.copyWith(
                          color: AppColors.foreground,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: AppColors.primary.withValues(alpha: 0.45),
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: mono,
                      children: [
                        const TextSpan(text: '{\n'),
                        TextSpan(
                          text: '  "name": ',
                          style: mono.copyWith(color: AppColors.primary),
                        ),
                        TextSpan(
                          text: '"Ikram Kolekar"',
                          style: mono.copyWith(color: AppColors.accent),
                        ),
                        const TextSpan(text: ',\n'),
                        TextSpan(
                          text: '  "role": ',
                          style: mono.copyWith(color: AppColors.primary),
                        ),
                        TextSpan(
                          text: '"Flutter Developer"',
                          style: mono.copyWith(color: AppColors.accent),
                        ),
                        const TextSpan(text: ',\n'),
                        TextSpan(
                          text: '  "location": ',
                          style: mono.copyWith(color: AppColors.primary),
                        ),
                        TextSpan(
                          text: '"India"',
                          style: mono.copyWith(color: AppColors.accent),
                        ),
                        const TextSpan(text: ',\n'),
                        TextSpan(
                          text: '  "experience": ',
                          style: mono.copyWith(color: AppColors.primary),
                        ),
                        TextSpan(
                          text: '"1+ years"',
                          style: mono.copyWith(color: AppColors.accent),
                        ),
                        const TextSpan(text: ',\n'),
                        TextSpan(
                          text: '  "passion": ',
                          style: mono.copyWith(color: AppColors.primary),
                        ),
                        TextSpan(
                          text: '"Building beautiful mobile apps"',
                          style: mono.copyWith(color: AppColors.accent),
                        ),
                        const TextSpan(text: ',\n'),
                        TextSpan(
                          text: '  "available": ',
                          style: mono.copyWith(color: AppColors.primary),
                        ),
                        TextSpan(
                          text: 'true',
                          style: mono.copyWith(color: const Color(0xFF4DE59B)),
                        ),
                        const TextSpan(text: '\n}'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: r'$ ',
                        style: mono.copyWith(
                          color: AppColors.primary.withValues(alpha: 0.92),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: _AnimatedTerminalCursor(
                          style: mono.copyWith(
                            color: AppColors.primary.withValues(alpha: 0.95),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsAndToolsPanel extends StatelessWidget {
  const _StatsAndToolsPanel({required this.metrics});

  final _SectionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    final cards = [
      const _InfoCardData(
        icon: Icons.location_on_outlined,
        label: 'Location',
        value: 'India',
      ),
      const _InfoCardData(
        icon: Icons.calendar_month_outlined,
        label: 'Experience',
        value: '1+ Years',
      ),
      const _InfoCardData(
        icon: Icons.code_rounded,
        label: 'Projects',
        value: '5+',
      ),
      const _InfoCardData(
        icon: Icons.favorite_border_rounded,
        label: 'Passion',
        value: 'Mobile Dev',
      ),
    ];

    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cards.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.75,
          ),
          itemBuilder: (context, index) =>
              _InfoCard(data: cards[index], metrics: metrics),
        ),
        const SizedBox(height: 12),
        _FavouriteToolsCard(metrics: metrics),
      ],
    );
  }
}

class _InfoCardData {
  const _InfoCardData({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.data, required this.metrics});

  final _InfoCardData data;
  final _SectionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      borderRadius: BorderRadius.circular(12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(data.icon, color: AppColors.primary, size: 22),
          const SizedBox(height: 9),
          Text(
            data.label,
            style: AppTextStyles.navLink.copyWith(
              fontSize: metrics.statTitleSize,
              color: AppColors.textMuted,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            data.value,
            style: AppTextStyles.subtitleBase.copyWith(
              fontSize: metrics.statValueSize,
              color: AppColors.foreground,
              fontWeight: FontWeight.w600,
              height: 1.05,
            ),
          ),
        ],
      ),
    );
  }
}

class _FavouriteToolsCard extends StatelessWidget {
  const _FavouriteToolsCard({required this.metrics});

  final _SectionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    final tools = ['VS Code', 'Git', 'Android Studio', 'Claude Code'];

    return _GlassCard(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      borderRadius: BorderRadius.circular(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '>_',
                style: AppTextStyles.badge.copyWith(
                  fontSize: metrics.isMobile ? 13 : 14,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'favourite_tools',
                style: GoogleFonts.jetBrainsMono(
                  color: AppColors.textMuted,
                  fontSize: metrics.isMobile ? 12 : 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tools
                .map(
                  (tool) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(alpha: 0.82),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tool,
                      style: AppTextStyles.navLink.copyWith(
                        fontSize: metrics.isMobile ? 12 : 13,
                        color: AppColors.secondaryForeground,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _TechStackCard extends StatelessWidget {
  const _TechStackCard({required this.metrics});

  final _SectionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    final stack = [
      'Flutter',
      'Dart',
      'Firebase',
      'REST APIs',
      'Riverpod',
      'GetX',
    ];

    return _GlassCard(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: metrics.isMobile ? 14 : 18,
        vertical: metrics.isMobile ? 14 : 16,
      ),
      borderRadius: BorderRadius.circular(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '// tech_stack',
            style: GoogleFonts.jetBrainsMono(
              color: AppColors.textMuted,
              fontSize: metrics.isMobile ? 12 : 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 11),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: stack
                .map(
                  (item) => Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: metrics.isMobile ? 12 : 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border, width: 1),
                    ),
                    child: Text(
                      item,
                      style: AppTextStyles.navLink.copyWith(
                        fontSize: metrics.isMobile ? 13 : 14,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _AnimatedTerminalCursor extends StatefulWidget {
  const _AnimatedTerminalCursor({required this.style});

  final TextStyle style;

  @override
  State<_AnimatedTerminalCursor> createState() =>
      _AnimatedTerminalCursorState();
}

class _AnimatedTerminalCursorState extends State<_AnimatedTerminalCursor>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    )..repeat(reverse: true);
    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: Text('▌', style: widget.style),
    );
  }
}

class _GlassCard extends StatelessWidget {
  const _GlassCard({
    required this.child,
    this.width,
    this.padding,
    this.borderRadius,
  });

  final Widget child;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(12);

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: const Color(0x851D2027),
        borderRadius: radius,
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: Padding(padding: padding ?? EdgeInsets.zero, child: child),
      ),
    );
  }
}
