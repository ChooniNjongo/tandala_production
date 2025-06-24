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

class NavbarItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? TColors.textPrimary.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(24), // Rounded chip shape
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              width: 16,
              height: 16,
              color: isSelected ? Colors.white : const Color(0xFFE5F7F9),
            ),
            const SizedBox(width: 8),
            Text(
              name,
              style: TextStyle(
                fontFamily: 'InterDisplay',
                fontSize: 14,
                height: 1.4,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : const Color(0xFFE5F7F9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}