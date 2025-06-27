import 'package:flutter/material.dart';

import '../../../utils/constants/color_system.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/typography.dart';
import '../containers/rounded_container.dart';

class TPill extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isSelected;
  final int? count;

  const TPill({
    super.key,
    required this.title,
    required this.isSelected,
    this.onTap,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        onTap: onTap,
        backgroundColor:
            isSelected ? const Color(0xFF00AFC1) : const Color(0xFF001113),
        radius: 32,
        child: Row(
          mainAxisSize:MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'InterDisplay',
                fontWeight: FontWeight.w400,
                fontSize: 13,
                height: 1.4, // 140% line height
                letterSpacing: 0,
                color: isSelected ? TColors.white : const Color(0xFF888888),
              ),
            ),
            if (count != null)
            const SizedBox(
              width: 8,
            ),
            if (count != null)
              Text(
                "(${count.toString()})",
                style: TextStyle(
                  fontFamily: 'InterDisplay',
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  height: 1.4, // 140% line height
                  letterSpacing: 0,
                  color: isSelected ? TColors.white : const Color(0xFF888888),
                ),
              ),
          ],
        ));
  }
}
