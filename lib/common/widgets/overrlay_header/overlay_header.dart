import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/constants/color_system.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/typography.dart';

class OverlayHeader extends StatelessWidget {
  final String label;
  final Color? backGroundColor;
  final String leftIcon;
  final String rightIcon;
  final Color? leftIconColor;
  final Color? rightIconColor;
  final bool mainHeader;

  const OverlayHeader({
    super.key,
    this.backGroundColor = TColors.primaryBackground, // Default to visible color
    this.leftIcon = TImages.arrowLeft,
    this.rightIcon = TImages.messageInActive,
    required this.label,
    this.leftIconColor = TColorSystem.n100,
    this.rightIconColor = TColorSystem.n100,
    this.mainHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backGroundColor, // Background color applied here
        border: const Border(
          bottom: BorderSide(
            color: TColors.iconBorder, // Border color from theme
            width: 1, // Thickness of the border
          ),
        ),
      ),
      width: double.infinity,
      height: 83,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            /// Leading Icon
            if (!mainHeader)
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: SvgPicture.asset(
                  leftIcon,
                  color: leftIconColor, // Color for the leading icon
                ),
              ),

            /// Label
            Text(
              label,
              style: mainHeader
                  ? TTypography.h3.copyWith(
                      color: TColorSystem.n200, // Text color from theme
                    )
                  : TTypography.h4.copyWith(
                      color: TColorSystem.n200, // Text color from theme
                    ),
            ),

            /// End Icon
            SvgPicture.asset(
              rightIcon,
              color: rightIconColor, // Color for the trailing icon
            ),
          ],
        ),
      ),
    );
  }
}
