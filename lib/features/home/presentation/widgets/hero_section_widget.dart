import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ikram_portfolio/app/theme/app_text_styles.dart';
import 'package:ikram_portfolio/common/widgets/hover_gradient_button.dart';
import 'package:ikram_portfolio/core/constants/app_colors.dart';
import 'package:ikram_portfolio/core/utils/resume_downloader.dart';
import 'package:ikram_portfolio/common/widgets/social_row.dart';
import 'package:url_launcher/url_launcher.dart';

/// Full-height hero / landing section displayed below the navbar.
class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onViewProjectsTap});

  final VoidCallback onViewProjectsTap;

  // ── Typed role strings ────────────────────────────────────────────────────
  static const List<String> _roles = [
    'UI Enthusiast',
    'Flutter Developer',
    'Mobile App Builder',
  ];

  static const String _resumeFilePath = '/resume/Ikram_Kolekar_Resume.pdf';
  static const String _resumeFileName = 'Ikram_Kolekar_Resume.pdf';

  Future<void> _handleResumeDownload(BuildContext context) async {
    final downloaded = await downloadResume(
      filePath: _resumeFilePath,
      fileName: _resumeFileName,
    );

    if (downloaded || !context.mounted) return;

    final fallbackUri = Uri.parse(Uri.base.resolve(_resumeFilePath).toString());
    if (await canLaunchUrl(fallbackUri)) {
      await launchUrl(fallbackUri, mode: LaunchMode.externalApplication);
      return;
    }

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Resume not found. Add your PDF at web/resume/Ikram_Kolekar_Resume.pdf',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ── Badge ─────────────────────────────────────────────────
              _HeroBadge(),
              const SizedBox(height: 42),

              // ── Main heading ──────────────────────────────────────────
              _HeroHeading(),
              const SizedBox(height: 24),

              // ── Animated subtitle ─────────────────────────────────────
              _AnimatedSubtitle(),
              const SizedBox(height: 20),

              // ── Description ───────────────────────────────────────────
              _HeroDescription(),
              const SizedBox(height: 40),

              // ── CTA buttons ───────────────────────────────────────────
              _CtaButtons(
                onViewProjectsTap: onViewProjectsTap,
                onDownloadResumeTap: () => _handleResumeDownload(context),
              ),
              const SizedBox(height: 40),

              // ── Social links ──────────────────────────────────────────
              SocialRow(),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Private sub-widgets
// ─────────────────────────────────────────────────────────────────────────────

/// Dark pill badge – dot + code greeting text.
/// Continuously pulses opacity 100% → 50% → 100% for a breathing effect.
class _HeroBadge extends StatefulWidget {
  @override
  State<_HeroBadge> createState() => _HeroBadgeState();
}

class _HeroBadgeState extends State<_HeroBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _opacity = Tween<double>(
      begin: 1.0,
      end: 0.5,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.badgeBg.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeTransition(
            opacity: _opacity,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '<hello world />',
            style: AppTextStyles.badge.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

/// "Hi, I'm [Ikram Kolekar]" – single-line heading with responsive font size.
///
/// The underline is drawn via [TextDecoration] on the same [Text] widget,
/// so [ShaderMask] applies the gradient to both text AND underline in a single
/// paint pass. This eliminates the font-loading race condition that occurred
/// when using [IntrinsicWidth] + a separate underline [Container].
class _HeroHeading extends StatelessWidget {
  static double _fontSize(double width) {
    if (width < 400) return 28;
    if (width < 500) return 34;
    if (width < 600) return 42;
    if (width < 750) return 52;
    if (width < 900) return 60;
    return 68;
  }

  @override
  Widget build(BuildContext context) {
    final fs = _fontSize(MediaQuery.of(context).size.width);

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hi, I'm ",
            style: AppTextStyles.heroHeadingBase.copyWith(fontSize: fs),
          ),
          // ShaderMask applies the gradient to both the text glyphs and the
          // TextDecoration underline in one pass – width always matches exactly.
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: AppColors.primaryGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
            blendMode: BlendMode.srcIn,
            child: Text(
              'Ikram Kolekar',
              style: AppTextStyles.heroHeadingGradient.copyWith(
                fontSize: fs,
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                decorationThickness: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// "I'm a [UI Enthusiast]|" – static prefix + animated typed part.
class _AnimatedSubtitle extends StatelessWidget {
  static double _fontSize(double width) {
    if (width < 400) return 13;
    if (width < 500) return 16;
    if (width < 600) return 20;
    if (width < 750) return 24;
    if (width < 900) return 28;
    return 32;
  }

  @override
  Widget build(BuildContext context) {
    final fs = _fontSize(MediaQuery.of(context).size.width);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "I'm a ",
          style: AppTextStyles.subtitleBase.copyWith(fontSize: fs),
        ),
        AnimatedTextKit(
          animatedTexts: HeroSection._roles
              .map(
                (role) => TyperAnimatedText(
                  role,
                  textStyle: AppTextStyles.subtitleAnimated.copyWith(
                    fontSize: fs,
                  ),
                  speed: const Duration(milliseconds: 80),
                ),
              )
              .toList(),
          repeatForever: true,
          pause: const Duration(milliseconds: 1200),
          displayFullTextOnTap: false,
        ),
        const SizedBox(width: 2),
        _TypingCursor(fontSize: fs),
      ],
    );
  }
}

/// Blinking caret shown after the animated typed role text.
class _TypingCursor extends StatefulWidget {
  const _TypingCursor({required this.fontSize});

  final double fontSize;

  @override
  State<_TypingCursor> createState() => _TypingCursorState();
}

class _TypingCursorState extends State<_TypingCursor>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _opacity = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
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
      child: Text(
        '|',
        style: AppTextStyles.subtitleAnimated.copyWith(
          fontSize: widget.fontSize,
          fontWeight: FontWeight.w300,
          color: AppColors.primary,
          height: 1,
        ),
      ),
    );
  }
}

/// Responsive body description paragraph.
class _HeroDescription extends StatelessWidget {
  static double _fontSize(double width) {
    if (width < 400) return 12;
    if (width < 500) return 13;
    if (width < 600) return 14;
    if (width < 750) return 15;
    if (width < 900) return 16;
    return 18;
  }

  @override
  Widget build(BuildContext context) {
    final fs = _fontSize(MediaQuery.of(context).size.width);
    return Text(
      'Flutter developer passionate about building scalable mobile\n'
      'applications and solving real-world problems.',
      style: AppTextStyles.bodyDescription.copyWith(fontSize: fs),
      textAlign: TextAlign.center,
    );
  }
}

/// Three CTA buttons – "View Projects", "Download Resume", "Contact Me".
class _CtaButtons extends StatelessWidget {
  const _CtaButtons({
    required this.onViewProjectsTap,
    required this.onDownloadResumeTap,
  });

  final VoidCallback onViewProjectsTap;
  final VoidCallback onDownloadResumeTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 14,
      alignment: WrapAlignment.center,
      children: [
        // Gradient primary button
        _GradientButton(label: 'View Projects', onTap: onViewProjectsTap),
        // Download Resume – outlined
        _OutlinedIconButton(
          label: 'Download Resume',
          icon: Icons.download_rounded,
          onTap: onDownloadResumeTap,
        ),
        // Contact Me – outlined
        _OutlinedButton(label: 'Contact Me', onTap: () {}),
      ],
    );
  }
}

/// Teal→purple gradient fill button.
class _GradientButton extends StatelessWidget {
  const _GradientButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return HoverGradientButton(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
      child: Text(label, style: AppTextStyles.buttonPrimary),
    );
  }
}

/// Outlined button with optional leading icon.
class _OutlinedIconButton extends StatefulWidget {
  const _OutlinedIconButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<_OutlinedIconButton> createState() => _OutlinedIconButtonState();
}

class _OutlinedIconButtonState extends State<_OutlinedIconButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.transparent,
            border: Border.all(
              color: _hovered
                  ? AppColors.primary.withValues(alpha: 0.6)
                  : AppColors.border,
              width: 1.5,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.25),
                      blurRadius: 16,
                      spreadRadius: 1,
                      offset: Offset.zero,
                      blurStyle: BlurStyle.outer,
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 16, color: AppColors.textPrimary),
              const SizedBox(width: 8),
              Text(widget.label, style: AppTextStyles.buttonOutlined),
            ],
          ),
        ),
      ),
    );
  }
}

/// Plain outlined button without icon.
class _OutlinedButton extends StatefulWidget {
  const _OutlinedButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  State<_OutlinedButton> createState() => _OutlinedButtonState();
}

class _OutlinedButtonState extends State<_OutlinedButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(1.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: _hovered
                  ? AppColors.highlightGradient
                  : AppColors.primaryGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.highlightGradient.first.withValues(
                        alpha: 0.22,
                      ),
                      blurRadius: 6,
                      spreadRadius: 0.6,
                      offset: Offset.zero,
                    ),
                    BoxShadow(
                      color: AppColors.highlightGradient.last.withValues(
                        alpha: 0.18,
                      ),
                      blurRadius: 8,
                      spreadRadius: 0.2,
                      offset: Offset.zero,
                    ),
                  ]
                : null,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(10.5),
            ),
            child: Text(widget.label, style: AppTextStyles.buttonOutlined),
          ),
        ),
      ),
    );
  }
}
