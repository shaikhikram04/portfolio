import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../theme/app_text_styles.dart';

/// Full-height hero / landing section displayed below the navbar.
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  // ── Social links ──────────────────────────────────────────────────────────
  static const String _githubUrl = 'https://github.com/';
  static const String _linkedInUrl = 'https://linkedin.com/in/';
  static const String _emailUrl = 'mailto:ikram@example.com';

  // ── Typed role strings ────────────────────────────────────────────────────
  static const List<String> _roles = [
    'UI Enthusiast',
    'Flutter Developer',
    'Mobile Engineer',
    'Open Source Fan',
  ];

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
              const SizedBox(height: 28),

              // ── Main heading ──────────────────────────────────────────
              _HeroHeading(),
              const SizedBox(height: 10),

              // ── Gradient underline ────────────────────────────────────
              _GradientUnderline(),
              const SizedBox(height: 20),

              // ── Animated subtitle ─────────────────────────────────────
              _AnimatedSubtitle(),
              const SizedBox(height: 20),

              // ── Description ───────────────────────────────────────────
              Text(
                'Flutter developer passionate about building scalable mobile\n'
                'applications and solving real-world problems.',
                style: AppTextStyles.bodyDescription,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // ── CTA buttons ───────────────────────────────────────────
              _CtaButtons(),
              const SizedBox(height: 40),

              // ── Social links ──────────────────────────────────────────
              _SocialRow(
                githubUrl: _githubUrl,
                linkedInUrl: _linkedInUrl,
                emailUrl: _emailUrl,
              ),
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
class _HeroBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.badgeBg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '<hello world />',
            style: AppTextStyles.badge,
          ),
        ],
      ),
    );
  }
}

/// "Hi, I'm [Ikram] [Shaikh]" – mixed-colour headline.
class _HeroHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text("Hi, I'm ", style: AppTextStyles.heroHeadingBase),
        Text('Ikram ', style: AppTextStyles.heroHeadingTeal),
        // "Shaikh" with a blue→purple gradient via ShaderMask
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: AppColors.shaikhGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          blendMode: BlendMode.srcIn,
          child: Text('Shaikh', style: AppTextStyles.heroHeadingGradient),
        ),
      ],
    );
  }
}

/// Horizontal gradient line below the heading.
class _GradientUnderline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 420,
      height: 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        gradient: const LinearGradient(
          colors: AppColors.underlineGradient,
        ),
      ),
    );
  }
}

/// "I'm a [UI Enthusiast]|" – static prefix + animated typed part.
class _AnimatedSubtitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("I'm a ", style: AppTextStyles.subtitleBase),
        AnimatedTextKit(
          animatedTexts: HeroSection._roles
              .map(
                (role) => TyperAnimatedText(
                  role,
                  textStyle: AppTextStyles.subtitleAnimated,
                  speed: const Duration(milliseconds: 80),
                ),
              )
              .toList(),
          repeatForever: true,
          pause: const Duration(milliseconds: 1200),
          displayFullTextOnTap: false,
        ),
      ],
    );
  }
}

/// Three CTA buttons – "View Projects", "Download Resume", "Contact Me".
class _CtaButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 14,
      alignment: WrapAlignment.center,
      children: [
        // Gradient primary button
        _GradientButton(
          label: 'View Projects',
          onTap: () {},
        ),
        // Download Resume – outlined
        _OutlinedIconButton(
          label: 'Download Resume',
          icon: Icons.download_rounded,
          onTap: () {},
        ),
        // Contact Me – outlined
        _OutlinedButton(
          label: 'Contact Me',
          onTap: () {},
        ),
      ],
    );
  }
}

/// Teal→purple gradient fill button.
class _GradientButton extends StatefulWidget {
  const _GradientButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  State<_GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<_GradientButton> {
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
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              colors: _hovered
                  ? [AppColors.accent, AppColors.primary]
                  : AppColors.primaryGradient,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.35),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    )
                  ]
                : [],
          ),
          child: Text(widget.label, style: AppTextStyles.buttonPrimary),
        ),
      ),
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
            borderRadius: BorderRadius.circular(8),
            color: _hovered
                ? AppColors.border.withValues(alpha: 0.5)
                : Colors.transparent,
            border: Border.all(
              color: _hovered ? AppColors.textSecondary : AppColors.border,
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 16,
                color: AppColors.textPrimary,
              ),
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: _hovered
                ? AppColors.border.withValues(alpha: 0.5)
                : Colors.transparent,
            border: Border.all(
              color: _hovered ? AppColors.textSecondary : AppColors.border,
              width: 1.5,
            ),
          ),
          child: Text(widget.label, style: AppTextStyles.buttonOutlined),
        ),
      ),
    );
  }
}

/// Three circular social icon buttons.
class _SocialRow extends StatelessWidget {
  const _SocialRow({
    required this.githubUrl,
    required this.linkedInUrl,
    required this.emailUrl,
  });

  final String githubUrl;
  final String linkedInUrl;
  final String emailUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialIconButton(
          icon: FontAwesomeIcons.github,
          tooltip: 'GitHub',
          onTap: () => _launchUrl(githubUrl),
        ),
        const SizedBox(width: 16),
        _SocialIconButton(
          icon: FontAwesomeIcons.linkedinIn,
          tooltip: 'LinkedIn',
          onTap: () => _launchUrl(linkedInUrl),
        ),
        const SizedBox(width: 16),
        _SocialIconButton(
          icon: Icons.mail_outline_rounded,
          tooltip: 'Email',
          onTap: () => _launchUrl(emailUrl),
          isFA: false,
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

/// Circular outlined icon button for social links.
class _SocialIconButton extends StatefulWidget {
  const _SocialIconButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
    this.isFA = true,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  /// `true` → render as [FaIcon], `false` → render as [Icon].
  final bool isFA;

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Tooltip(
        message: widget.tooltip,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _hovered
                  ? AppColors.primary.withValues(alpha: 0.12)
                  : Colors.transparent,
              border: Border.all(
                color: _hovered ? AppColors.primary : AppColors.border,
                width: 1.5,
              ),
            ),
            child: Center(
              child: widget.isFA
                  ? FaIcon(
                      widget.icon,
                      size: 17,
                      color: _hovered
                          ? AppColors.primary
                          : AppColors.textSecondary,
                    )
                  : Icon(
                      widget.icon,
                      size: 20,
                      color: _hovered
                          ? AppColors.primary
                          : AppColors.textSecondary,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
