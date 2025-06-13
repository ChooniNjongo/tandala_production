import 'package:flutter/material.dart';

import '../../../utils/constants/color_system.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/typography.dart';
import '../containers/rounded_container.dart';

class TPill extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isSelected;

  const TPill({
    super.key,
    required this.title,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        onTap: onTap,
        backgroundColor:
            isSelected ? TColors.primary500 : const Color(0xFF001113),
        radius: 32,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'InterDisplay',
            fontWeight: FontWeight.w400,
            fontSize: 13,
            height: 1.4, // 140% line height
            letterSpacing: 0,
            color: isSelected ? TColors.primary500 : const Color(0xFF888888),
          ),
        ));
  }
}
