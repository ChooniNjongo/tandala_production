import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/colors.dart';

class TSvg extends StatelessWidget {
  const TSvg({
    super.key,
    required this.isSelected,
    required this.activeImage,
    required this.inActiveImage,
    required this.height,
  });

  final bool isSelected;
  final String activeImage;
  final String inActiveImage;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      height: height,
      isSelected ? activeImage : inActiveImage,
      color: isSelected ? TColors.primary500 : TColors.textIconFilterInactive,
    );
  }
}
