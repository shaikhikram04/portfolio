import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ikram_portfolio/core/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

/// Three circular social icon buttons.
class SocialRow extends StatelessWidget {
  const SocialRow({super.key, this.scaleFactor = 1.0});

  final double scaleFactor;

  // ── Social links ──────────────────────────────────────────────────────────
  static const String _githubUrl = 'https://github.com/shaikhikram04';
  static const String _linkedInUrl =
      'https://www.linkedin.com/in/ikram-kolekar-95b5b0250';
  static const String _emailUrl = 'mailto:ikramkolekar045@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialIconButton(
          icon: FontAwesomeIcons.github,
          onTap: () => _launchUrl(_githubUrl),
          sizeFactor: scaleFactor,
        ),
        SizedBox(width: 16 * scaleFactor),
        _SocialIconButton(
          icon: FontAwesomeIcons.linkedinIn,
          onTap: () => _launchUrl(_linkedInUrl),
          sizeFactor: scaleFactor,
        ),
        SizedBox(width: 16 * scaleFactor),
        _SocialIconButton(
          icon: Icons.mail_outline_rounded,
          onTap: () => _launchUrl(_emailUrl),
          isFA: false,
          sizeFactor: scaleFactor,
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
    required this.onTap,
    required this.sizeFactor,
    this.isFA = true,
  });

  final IconData icon;
  final VoidCallback onTap;
  final double sizeFactor;

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
      child: GestureDetector(
        onTap: widget.onTap,
        child: SizedBox(
          width: 60 * widget.sizeFactor,
          height: 60 * widget.sizeFactor,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              width: _hovered ? 60 * widget.sizeFactor : 52 * widget.sizeFactor,
              height: _hovered
                  ? 60 * widget.sizeFactor
                  : 52 * widget.sizeFactor,
              decoration: BoxDecoration(
                color: _hovered
                    ? Colors.transparent
                    : AppColors.secondary.withValues(alpha: 0.3),
                border: Border.all(
                  color: _hovered
                      ? AppColors.primary.withValues(alpha: 0.25)
                      : AppColors.border,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: widget.isFA
                    ? FaIcon(
                        widget.icon,
                        size: _hovered
                            ? 22 * widget.sizeFactor
                            : 18 * widget.sizeFactor,
                        color: _hovered
                            ? AppColors.primary
                            : AppColors.textSecondary,
                      )
                    : Icon(
                        widget.icon,
                        size: _hovered
                            ? 24 * widget.sizeFactor
                            : 20 * widget.sizeFactor,
                        color: _hovered
                            ? AppColors.primary
                            : AppColors.textSecondary,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
