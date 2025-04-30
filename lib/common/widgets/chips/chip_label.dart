import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/color_system.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/typography.dart';
import '../containers/rounded_container.dart';

class ChipLabel extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool small;
  final void Function()? onTap;
  final String? leftIcon;
  final String? rightIcon;

  const ChipLabel(
      {super.key,
      required this.label,
      required this.isSelected,
      this.small = false,
      this.onTap, this.leftIcon, this.rightIcon});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      margin: const EdgeInsets.all(8),
      backgroundColor:
          isSelected ? TColorSystem.n100 : TColors.primaryBackground,
      showBorder: true,
      borderWidth: 1,
      borderColor: isSelected ? TColorSystem.n100 : Colors.white,
      showShadow: false,
      height: small ? 36 : 48,
      radius: 100,
      child:Row(
        mainAxisSize: MainAxisSize.min, // Hug content
        children: [
          if (leftIcon != null) ...[
            SvgPicture.asset(leftIcon!),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            // Add spacing between icon and text
          ],
          Text(
            label,
            textAlign: TextAlign.center,
            style: TTypography.label16Regular.copyWith(color:isSelected? TColorSystem.n800: TColorSystem.n100),
          ),
          if (rightIcon != null) ...[
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            // Add spacing between text and icon
            SvgPicture.asset(rightIcon!),
          ],
        ],
      ),
    );
  }
}
