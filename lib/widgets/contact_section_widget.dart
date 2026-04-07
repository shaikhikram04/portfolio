import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ikram_portfolio/widgets/social_row.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import 'portfolio_logo_widget.dart';
import 'section_backdrop_widget.dart';
import '../theme/app_text_styles.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  static const String _email = 'ikramshaikh@email.com';
  static const String _emailUrl = 'mailto:ikramshaikh@email.com';
  static const String _githubUrl = 'https://github.com/shaikhikram04';
  static const String _linkedInUrl =
      'https://www.linkedin.com/in/ikram-kolekar-95b5b0250';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final metrics = _ContactSectionMetrics.fromWidth(width);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: metrics.sectionTopPadding),
      child: Stack(
        children: [
          const Positioned.fill(
            child: SectionBackdrop(yOffset: -1.8, radius: 1.7),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: metrics.horizontalPadding,
              vertical: metrics.verticalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1132),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _SectionHeading(metrics: metrics),
                        SizedBox(height: metrics.cardsTopGap),
                        metrics.isMobile
                            ? Column(
                                children: [
                                  _ContactFormCard(metrics: metrics),
                                  SizedBox(height: metrics.cardsGap),
                                  _ConnectCard(metrics: metrics),
                                ],
                              )
                            : IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: _ContactFormCard(metrics: metrics),
                                    ),
                                    SizedBox(width: metrics.cardsGap),
                                    Expanded(
                                      flex: 5,
                                      child: _ConnectCard(metrics: metrics),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: metrics.footerTopGap),
                _Footer(metrics: metrics),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> _launchExternal(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

class _ContactSectionMetrics {
  const _ContactSectionMetrics({
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.sectionTopPadding,
    required this.sectionLabelSize,
    required this.titleSize,
    required this.subtitleSize,
    required this.cardsTopGap,
    required this.cardsGap,
    required this.formCardPadding,
    required this.connectCardPadding,
    required this.fieldLabelSize,
    required this.fieldTextSize,
    required this.sendButtonHeight,
    required this.sendButtonWidth,
    required this.footerTopGap,
    required this.footerBottomPadding,
    required this.footerLogoSize,
    required this.footerCaptionSize,
    required this.footerCopyrightSize,
    required this.iconButtonSize,
    required this.connectTitleSize,
    required this.connectBodySize,
    required this.linkTextSize,
    required this.messageFieldHeight,
    required this.isMobile,
  });

  final double horizontalPadding;
  final double verticalPadding;
  final double sectionTopPadding;
  final double sectionLabelSize;
  final double titleSize;
  final double subtitleSize;
  final double cardsTopGap;
  final double cardsGap;
  final EdgeInsets formCardPadding;
  final EdgeInsets connectCardPadding;
  final double fieldLabelSize;
  final double fieldTextSize;
  final double sendButtonHeight;
  final double sendButtonWidth;
  final double footerTopGap;
  final double footerBottomPadding;
  final double footerLogoSize;
  final double footerCaptionSize;
  final double footerCopyrightSize;
  final double iconButtonSize;
  final double connectTitleSize;
  final double connectBodySize;
  final double linkTextSize;
  final double messageFieldHeight;
  final bool isMobile;

  static _ContactSectionMetrics fromWidth(double width) {
    final title = _titleSize(width);

    if (width < 760) {
      return _ContactSectionMetrics(
        horizontalPadding: 18,
        verticalPadding: 32,
        sectionTopPadding: 44,
        sectionLabelSize: 14,
        titleSize: title,
        subtitleSize: 16,
        cardsTopGap: 34,
        cardsGap: 16,
        formCardPadding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
        connectCardPadding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
        fieldLabelSize: 13,
        fieldTextSize: 16,
        sendButtonHeight: 48,
        sendButtonWidth: 176,
        footerTopGap: 64,
        footerBottomPadding: 26,
        footerLogoSize: 30,
        footerCaptionSize: 14,
        footerCopyrightSize: 13,
        iconButtonSize: 42,
        connectTitleSize: 16,
        connectBodySize: 16,
        linkTextSize: 16,
        messageFieldHeight: 132,
        isMobile: true,
      );
    }

    if (width < 980) {
      return _ContactSectionMetrics(
        horizontalPadding: 24,
        verticalPadding: 42,
        sectionTopPadding: 44,
        sectionLabelSize: 14,
        titleSize: title,
        subtitleSize: 16,
        cardsTopGap: 36,
        cardsGap: 18,
        formCardPadding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
        connectCardPadding: const EdgeInsets.fromLTRB(20, 22, 20, 22),
        fieldLabelSize: 13,
        fieldTextSize: 18,
        sendButtonHeight: 48,
        sendButtonWidth: 182,
        footerTopGap: 72,
        footerBottomPadding: 26,
        footerLogoSize: 30,
        footerCaptionSize: 14,
        footerCopyrightSize: 13,
        iconButtonSize: 44,
        connectTitleSize: 16,
        connectBodySize: 16,
        linkTextSize: 16,
        messageFieldHeight: 132,
        isMobile: true,
      );
    }

    return _ContactSectionMetrics(
      horizontalPadding: 32,
      verticalPadding: 84,
      sectionTopPadding: 64,
      sectionLabelSize: 15,
      titleSize: title,
      subtitleSize: 16,
      cardsTopGap: 56,
      cardsGap: 28,
      formCardPadding: const EdgeInsets.fromLTRB(32, 28, 32, 28),
      connectCardPadding: const EdgeInsets.fromLTRB(28, 28, 28, 28),
      fieldLabelSize: 13,
      fieldTextSize: 18,
      sendButtonHeight: 48,
      sendButtonWidth: 190,
      footerTopGap: 80,
      footerBottomPadding: 30,
      footerLogoSize: 30,
      footerCaptionSize: 14,
      footerCopyrightSize: 13,
      iconButtonSize: 44,
      connectTitleSize: 16,
      connectBodySize: 16,
      linkTextSize: 16,
      messageFieldHeight: 148,
      isMobile: false,
    );
  }

  static double _titleSize(double width) {
    if (width < 640) return 26;
    if (width < 824) return 30;
    if (width < 1024) return 30;
    return 32;
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({required this.metrics});

  final _ContactSectionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            '// contact',
            style: AppTextStyles.badge.copyWith(
              fontSize: metrics.sectionLabelSize,
              color: AppColors.primary.withValues(alpha: 0.95),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Get in ',
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
                  'Touch',
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
        ),
        const SizedBox(height: 18),
        Center(
          child: Text(
            "Have an idea for an app? Let's build it together.",
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyDescription.copyWith(
              fontSize: metrics.subtitleSize,
              color: AppColors.textMuted,
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactFormCard extends StatelessWidget {
  const _ContactFormCard({required this.metrics});

  final _ContactSectionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: metrics.formCardPadding,
      decoration: BoxDecoration(
        color: AppColors.card.withValues(alpha: 0.78),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          metrics.isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _FieldBlock(
                      label: 'name',
                      hint: 'Your name',
                      metrics: metrics,
                    ),
                    const SizedBox(height: 12),
                    _FieldBlock(
                      label: 'email',
                      hint: 'your@email.com',
                      metrics: metrics,
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: _FieldBlock(
                        label: 'name',
                        hint: 'Your name',
                        metrics: metrics,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _FieldBlock(
                        label: 'email',
                        hint: 'your@email.com',
                        metrics: metrics,
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 22),
          _FieldBlock(
            label: 'message',
            hint: 'Tell me about your project...',
            maxLines: 6,
            minLines: 6,
            fixedHeight: metrics.messageFieldHeight,
            metrics: metrics,
          ),
          const SizedBox(height: 32),
          _SendMessageButton(metrics: metrics),
        ],
      ),
    );
  }
}

class _FieldBlock extends StatelessWidget {
  const _FieldBlock({
    required this.label,
    required this.hint,
    required this.metrics,
    this.maxLines = 1,
    this.minLines = 1,
    this.fixedHeight,
  });

  final String label;
  final String hint;
  final _ContactSectionMetrics metrics;
  final int maxLines;
  final int minLines;
  final double? fixedHeight;

  @override
  Widget build(BuildContext context) {
    final field = TextField(
      minLines: minLines,
      maxLines: maxLines,
      style: AppTextStyles.bodyDescription.copyWith(
        fontSize: metrics.fieldTextSize,
        color: AppColors.textPrimary.withValues(alpha: 0.92),
        height: 1.25,
      ),
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.secondary.withValues(alpha: 0.85),
        hintText: hint,
        hintStyle: AppTextStyles.bodyDescription.copyWith(
          fontSize: metrics.fieldTextSize,
          color: AppColors.textMuted.withValues(alpha: 0.82),
          height: 1.25,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.border.withValues(alpha: 0.8),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.border.withValues(alpha: 0.8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.2),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.badge.copyWith(
            fontSize: metrics.fieldLabelSize,
            color: AppColors.textMuted.withValues(alpha: 0.9),
            letterSpacing: 0.35,
          ),
        ),
        const SizedBox(height: 8),
        if (fixedHeight != null)
          SizedBox(height: fixedHeight, child: field)
        else
          field,
      ],
    );
  }
}

class _SendMessageButton extends StatefulWidget {
  const _SendMessageButton({required this.metrics});

  final _ContactSectionMetrics metrics;

  @override
  State<_SendMessageButton> createState() => _SendMessageButtonState();
}

class _SendMessageButtonState extends State<_SendMessageButton> {
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
          width: widget.metrics.sendButtonWidth,
          height: widget.metrics.sendButtonHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: _hovered
                  ? AppColors.highlightGradient
                  : AppColors.primaryGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: _hovered ? const [0.3, 0.9] : const [0.2, 0.9],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.send_rounded,
                size: 16,
                color: AppColors.primaryForeground,
              ),
              const SizedBox(width: 8),
              Text(
                'Send Message',
                style: AppTextStyles.buttonPrimary.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConnectCard extends StatelessWidget {
  const _ConnectCard({required this.metrics});

  final _ContactSectionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: metrics.connectCardPadding,
      decoration: BoxDecoration(
        color: AppColors.card.withValues(alpha: 0.74),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border.withValues(alpha: 0.8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primary.withValues(alpha: 0.12),
                ),
                child: const Icon(
                  Icons.chat_bubble_outline_rounded,
                  size: 20,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "Let's Connect",
                style: AppTextStyles.subtitleBase.copyWith(
                  fontSize: metrics.connectTitleSize,
                  color: AppColors.textPrimary.withValues(alpha: 0.95),
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            "I'm always open to discussing new projects, creative ideas, or opportunities. Let's create something amazing.",
            style: AppTextStyles.bodyDescription.copyWith(
              fontSize: metrics.connectBodySize,
              color: AppColors.textMuted.withValues(alpha: 0.95),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 36),
          _ContactLinkTile(
            icon: Icons.mail_outline_rounded,
            label: ContactSection._email,
            onTap: () =>
                ContactSection._launchExternal(ContactSection._emailUrl),
            metrics: metrics,
          ),
          const SizedBox(height: 28),
          _ContactLinkTile(
            icon: FontAwesomeIcons.linkedinIn,
            label: 'LinkedIn Profile',
            isFontAwesome: true,
            onTap: () =>
                ContactSection._launchExternal(ContactSection._linkedInUrl),
            metrics: metrics,
          ),
          const SizedBox(height: 28),
          _ContactLinkTile(
            icon: FontAwesomeIcons.github,
            label: 'GitHub Profile',
            isFontAwesome: true,
            onTap: () =>
                ContactSection._launchExternal(ContactSection._githubUrl),
            metrics: metrics,
          ),
        ],
      ),
    );
  }
}

class _ContactLinkTile extends StatefulWidget {
  const _ContactLinkTile({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.metrics,
    this.isFontAwesome = false,
  });

  final IconData icon;
  final String label;
  final bool isFontAwesome;
  final VoidCallback onTap;
  final _ContactSectionMetrics metrics;

  @override
  State<_ContactLinkTile> createState() => _ContactLinkTileState();
}

class _ContactLinkTileState extends State<_ContactLinkTile> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: _hovered
                      ? AppColors.primary.withValues(alpha: 0.7)
                      : AppColors.border.withValues(alpha: 0.85),
                  width: 1,
                ),
                color: _hovered
                    ? AppColors.primary.withValues(alpha: 0.14)
                    : AppColors.secondary.withValues(alpha: 0.65),
              ),
              child: Center(
                child: widget.isFontAwesome
                    ? FaIcon(
                        widget.icon,
                        size: 18,
                        color: _hovered
                            ? AppColors.primary
                            : AppColors.textSecondary.withValues(alpha: 0.9),
                      )
                    : Icon(
                        widget.icon,
                        size: 18,
                        color: _hovered
                            ? AppColors.primary
                            : AppColors.textSecondary.withValues(alpha: 0.9),
                      ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.label,
                style: AppTextStyles.bodyDescription.copyWith(
                  fontSize: widget.metrics.linkTextSize,
                  color: _hovered
                      ? AppColors.textPrimary.withValues(alpha: 0.95)
                      : AppColors.textMuted.withValues(alpha: 0.95),
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.metrics});

  final _ContactSectionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    final socialButtons = SocialRow(scaleFactor: 0.9);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(height: 1, color: AppColors.border.withValues(alpha: 0.8)),
        const SizedBox(height: 24),
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1132),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: metrics.footerBottomPadding),
                  child: metrics.isMobile
                      ? Column(
                          children: [
                            _FooterBrand(metrics: metrics),
                            const SizedBox(height: 20),
                            socialButtons,
                          ],
                        )
                      : Row(
                          children: [
                            _FooterBrand(metrics: metrics),
                            const Spacer(),
                            socialButtons,
                          ],
                        ),
                ),
                Container(
                  height: 1,
                  color: AppColors.border.withValues(alpha: 0.8),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 22),
        Text(
          '© 2026 Ikram Kolekar. All rights reserved.',
          textAlign: TextAlign.center,
          style: AppTextStyles.navLink.copyWith(
            fontSize: metrics.footerCopyrightSize,
            color: AppColors.textMuted.withValues(alpha: 0.82),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _FooterBrand extends StatelessWidget {
  const _FooterBrand({required this.metrics});

  final _ContactSectionMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PortfolioLogoText(),
        const SizedBox(height: 6),
        RichText(
          text: TextSpan(
            style: AppTextStyles.bodyDescription.copyWith(
              fontSize: metrics.footerCaptionSize,
              color: AppColors.textMuted.withValues(alpha: 0.95),
              height: 1.2,
            ),
            children: [
              const TextSpan(text: 'Built with '),
              TextSpan(
                text: 'Flutter',
                style: AppTextStyles.bodyDescription.copyWith(
                  fontSize: metrics.footerCaptionSize,
                  color: AppColors.primary.withValues(alpha: 0.92),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const TextSpan(text: ' mindset & '),
              TextSpan(
                text: '❤',
                style: AppTextStyles.bodyDescription.copyWith(
                  fontSize: metrics.footerCaptionSize,
                  color: const Color(0xFFFF5A5A),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FooterSocialButton extends StatefulWidget {
  const _FooterSocialButton({
    required this.icon,
    required this.onTap,
    required this.metrics,
    this.isFontAwesome = true,
  });

  final IconData icon;
  final VoidCallback onTap;
  final _ContactSectionMetrics metrics;
  final bool isFontAwesome;

  @override
  State<_FooterSocialButton> createState() => _FooterSocialButtonState();
}

class _FooterSocialButtonState extends State<_FooterSocialButton> {
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
          width: widget.metrics.iconButtonSize,
          height: widget.metrics.iconButtonSize,
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.primary.withValues(alpha: 0.12)
                : AppColors.secondary.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hovered ? AppColors.primary : AppColors.border,
              width: 1.2,
            ),
          ),
          child: Center(
            child: widget.isFontAwesome
                ? FaIcon(
                    widget.icon,
                    size: widget.metrics.iconButtonSize * 0.36,
                    color: _hovered
                        ? AppColors.primary
                        : AppColors.textSecondary.withValues(alpha: 0.9),
                  )
                : Icon(
                    widget.icon,
                    size: widget.metrics.iconButtonSize * 0.4,
                    color: _hovered
                        ? AppColors.primary
                        : AppColors.textSecondary.withValues(alpha: 0.9),
                  ),
          ),
        ),
      ),
    );
  }
}
