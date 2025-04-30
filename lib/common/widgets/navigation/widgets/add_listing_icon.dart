import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class AddListingIcon extends StatelessWidget {
  const AddListingIcon({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      isSelected ? TImages.addListingActive : TImages.addListingActive,
      color: isSelected ? TColors.primary500 : TColors.textIconFilterInactive,
      height: 40,
      allowDrawingOutsideViewBox: true,
      alignment: Alignment.bottomCenter,
    );
  }
}
