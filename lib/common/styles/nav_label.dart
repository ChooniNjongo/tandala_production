import 'package:flutter/material.dart';

import '../../utils/constants/color_system.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/typography.dart';

TextStyle navTextStyle(bool isSelected) {
  return TTypography.label12Regular.copyWith(
      fontSize: 10,
      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
      color: isSelected ? TColors.primary500 : TColorSystem.n600);
}
