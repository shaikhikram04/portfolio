import 'dart:ui';

import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../theme/app_text_styles.dart';

/// Responsive top navigation bar.
///
/// On wide screens (≥ 900 px) it shows the full link row.
/// On narrow screens it collapses to a hamburger menu.
class PortfolioNavBar extends StatefulWidget {
  const PortfolioNavBar({
    super.key,
    this.activeSection = 'Home',
    this.isScrolled = false,
  });

  final String activeSection;
  final bool isScrolled;

  @override
  State<PortfolioNavBar> createState() => _PortfolioNavBarState();
}

class _PortfolioNavBarState extends State<PortfolioNavBar> {
  static const List<String> _sections = [
    'Home',
    'About',
    'Projects',
    'Skills',
    'Experience',
    'Contact',
  ];

  String _hoveredLink = '';

  /// Maps screen width to a sensible horizontal padding:
  ///
  /// | Width          | Padding |
  /// |----------------|---------|
  /// | < 600          |  16 px  |
  /// | 600 – 899      |  32 px  |
  /// | 900 – 1199     |  60 px  |
  /// | 1200 – 1599    |  100 px |
  /// | ≥ 1600         |  140 px |
  double _responsiveHPadding(double width) {
    if (width < 600) return 26;
    if (width < 900) return 42;
    if (width < 1200) return 80;
    if (width < 1600) return 160;
    return 240;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final hPadding = _responsiveHPadding(width);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: widget.isScrolled ? 16 : 0,
          sigmaY: widget.isScrolled ? 16 : 0,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 18),
          decoration: BoxDecoration(
            color: widget.isScrolled
                ? AppColors.card.withValues(alpha: 0.50)
                : Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: widget.isScrolled
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.transparent,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              // ── Logo ───────────────────────────────────────────────────────
              _LogoText(),
              const Spacer(),
              // ── Nav Links (desktop) ────────────────────────────────────────
              LayoutBuilder(
                builder: (context, constraints) {
                  if (width >= 900) {
                    return Row(
                      children: _sections
                          .map(
                            (s) => _NavLink(
                              label: s,
                              isActive: widget.activeSection == s,
                              isHovered: _hoveredLink == s,
                              onHoverChange: (hov) =>
                                  setState(() => _hoveredLink = hov ? s : ''),
                            ),
                          )
                          .toList(),
                    );
                  }
                  // Hamburger for smaller screens
                  return IconButton(
                    icon: const Icon(
                      Icons.menu_rounded,
                      color: AppColors.textSecondary,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Public drawer ────────────────────────────────────────────────────────────

/// Side drawer shown on narrow screens when the hamburger is tapped.
class PortfolioDrawer extends StatelessWidget {
  const PortfolioDrawer({super.key, this.activeSection = 'Home'});

  final String activeSection;

  static const List<String> _sections = [
    'Home',
    'About',
    'Projects',
    'Skills',
    'Experience',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      width: 260,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Drawer header ────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
              child: _LogoText(),
            ),
            Divider(color: AppColors.border, height: 1, thickness: 1),
            const SizedBox(height: 12),

            // ── Nav items ────────────────────────────────────────────
            ..._sections.map(
              (s) => _DrawerNavItem(
                label: s,
                isActive: activeSection == s,
                onTap: () => Navigator.pop(context),
              ),
            ),

            const Spacer(),

            // ── Footer ───────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Text(
                '© 2025 Ikram Shaikh',
                style: AppTextStyles.navLink.copyWith(
                  fontSize: 11,
                  color: AppColors.textMuted,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Single row item inside [PortfolioDrawer].
class _DrawerNavItem extends StatefulWidget {
  const _DrawerNavItem({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<_DrawerNavItem> createState() => _DrawerNavItemState();
}

class _DrawerNavItemState extends State<_DrawerNavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final highlighted = widget.isActive || _hovered;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: highlighted
                ? AppColors.primary.withValues(alpha: 0.10)
                : Colors.transparent,
          ),
          child: Row(
            children: [
              // Active / hover indicator bar
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 3,
                height: 18,
                margin: const EdgeInsets.only(right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: highlighted ? AppColors.primary : Colors.transparent,
                ),
              ),
              Text(
                widget.label,
                style: highlighted
                    ? AppTextStyles.navLinkActive
                    : AppTextStyles.navLink,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Private sub-widgets ───────────────────────────────────────────────────────

class _LogoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: 'IK', style: AppTextStyles.logo),
          TextSpan(
            text: '.',
            style: AppTextStyles.logo.copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({
    required this.label,
    required this.isActive,
    required this.isHovered,
    required this.onHoverChange,
  });

  final String label;
  final bool isActive;
  final bool isHovered;
  final ValueChanged<bool> onHoverChange;

  @override
  Widget build(BuildContext context) {
    final highlighted = isActive || isHovered;
    return MouseRegion(
      onEnter: (_) => onHoverChange(true),
      onExit: (_) => onHoverChange(false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 180),
            style: highlighted
                ? AppTextStyles.navLinkActive
                : AppTextStyles.navLink,
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
