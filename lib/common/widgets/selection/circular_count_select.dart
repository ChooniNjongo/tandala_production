import 'package:flutter/material.dart';

import '../../../utils/constants/color_system.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/typography.dart';

class CircularCountSelect extends StatelessWidget {
  final String count;
  final bool isSelected;
  final void Function()? onTap;

  const CircularCountSelect({
    super.key,
    required this.count,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64,
        // Equal  width and height
        height: 64,
        decoration: BoxDecoration(
          color: isSelected ? TColors.primary500 : Colors.transparent,
          shape: BoxShape.circle, // Makes the container circular
          border: Border.all(
            color: isSelected ? TColors.primary100 : TColors.iconBorder,
            // Blue border color
            width: 1, // Border width
          ),
        ),
        alignment: Alignment.center,
        // Centers the text inside the circle
        child: Text(
          count,
          style: TTypography.h3.copyWith(color: TColorSystem.n100),
        ),
      ),
    );
  }
}
