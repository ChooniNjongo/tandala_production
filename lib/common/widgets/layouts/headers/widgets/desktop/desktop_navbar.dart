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
        padding: const EdgeInsets.fromLTRB(2, 12, 4, 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? const Color(0xFF00AFC1) : Colors.transparent,
              width: 1.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              icon,
              width: 16, // optional: adjust size
              height: 16,
              color: isSelected ? const Color(0xFF00AFC1) : const Color(0xFFE5F7F9),
            ),
            const SizedBox(width: 8), // gap
            Text(
              name,
              style: TextStyle(
                fontFamily: 'InterDisplay',
                fontSize: 14,
                height: 1.4, // 140% line height
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? const Color(0xFF00AFC1)
                    : const Color(0xFFE5F7F9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
