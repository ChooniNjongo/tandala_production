import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../utils/constants/image_strings.dart';

class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavbarItem(
          isSelected: true,
          name: 'Home',
          icon: TImages.home02,
          onPressed: () {},
        ),
        const SizedBox(
          width: 24,
        ),
        NavbarItem(
          isSelected: false,
          name: 'Apartments',
          icon: TImages.apartment,
          onPressed: () {},
        ),
        const SizedBox(
          width: 24,
        ),
        NavbarItem(
          isSelected: false,
          name: 'Lodges',
          icon: TImages.lodge,
          onPressed: () {},
        ),
        const SizedBox(
          width: 24,
        ),
        NavbarItem(
          isSelected: false,
          name: 'Hotels',
          icon: TImages.hotel,
          onPressed: () {},
        ),
      ],
    );
  }
}

class NavbarItem extends StatefulWidget {
  const NavbarItem({
    super.key,
    required this.isSelected,
    required this.name,
    required this.icon,
    required this.onPressed,
  });

  final bool isSelected;
  final String name;
  final String icon;
  final VoidCallback onPressed;

  @override
  State<NavbarItem> createState() => _NavbarItemState();
}

class _NavbarItemState extends State<NavbarItem>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onHoverChanged(bool isHovered) {
    if (!widget.isSelected) {
      setState(() {
        _isHovered = isHovered;
      });

      if (isHovered) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  Color _getBackgroundColor() {
    if (widget.isSelected) {
      return TColors.textPrimary.withOpacity(0.1);
    }
    if (_isHovered) {
      return const Color(0xFFE5F7F9).withOpacity(0.05);
    }
    return Colors.transparent;
  }

  Color _getBorderColor() {
    if (widget.isSelected) {
      return const Color(0xFFE5F7F9);
    }
    if (_isHovered) {
      return const Color(0xFFE5F7F9).withOpacity(0.3);
    }
    return Colors.transparent;
  }

  Color _getIconColor() {
    if (widget.isSelected) {
      return Colors.white;
    }
    if (_isHovered) {
      return Colors.white.withOpacity(0.9);
    }
    return const Color(0xFFE5F7F9);
  }

  Color _getTextColor() {
    if (widget.isSelected) {
      return Colors.white;
    }
    if (_isHovered) {
      return Colors.white.withOpacity(0.9);
    }
    return const Color(0xFFE5F7F9);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHoverChanged(true),
      onExit: (_) => _onHoverChanged(false),
      cursor: SystemMouseCursors.click,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: GestureDetector(
              onTap: widget.onPressed,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _getBorderColor(),
                    width: 1,
                  ),
                  color: _getBackgroundColor(),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: _isHovered && !widget.isSelected
                      ? [
                    BoxShadow(
                      color: const Color(0xFFE5F7F9).withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                      : null,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      child: SvgPicture.asset(
                        widget.icon,
                        width: 16,
                        height: 16,
                        color: _getIconColor(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 200),
                      style: TextStyle(
                        fontFamily: 'InterDisplay',
                        fontSize: 14,
                        height: 1.4,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                        color: _getTextColor(),
                      ),
                      child: Text(widget.name),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}