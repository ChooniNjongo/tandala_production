import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/typography.dart';

class ExtensibleHugContentOutlineButton extends StatelessWidget {
  final String buttonLabel;
  final void Function()? onPressed;
  final EdgeInsetsGeometry contentPadding;
  final Color? buttonLabelColor;
  final String? leftIcon;
  final String? rightIcon;
  final double borderWidth;
  final bool small;

  const ExtensibleHugContentOutlineButton({
    super.key,
    required this.buttonLabel,
    required this.onPressed,
    this.contentPadding = const EdgeInsets.symmetric(
        horizontal: TSizes.spaceBtwItems, vertical: 0),
    this.buttonLabelColor = TColors.white,
    this.leftIcon,
    this.rightIcon,
    this.borderWidth = 1.0,  this.small = false, // Default border width
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: small ? 36 : 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: TColors.white, width: borderWidth),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Customize border radius
          ),
        ),
        child: Padding(
          padding: contentPadding,
          child: Row(
            mainAxisSize: MainAxisSize.min, // Hug content
            children: [
              if (leftIcon != null) ...[
                SvgPicture.asset(leftIcon!),
                const SizedBox(width: TSizes.spaceBtwItems / 2),
                // Add spacing between icon and text
              ],
              Text(
                buttonLabel,
                textAlign: TextAlign.center,
                style: TTypography.label16Regular.copyWith(color: buttonLabelColor),
              ),
              if (rightIcon != null) ...[
                const SizedBox(width: TSizes.spaceBtwItems / 2),
                // Add spacing between text and icon
                SvgPicture.asset(rightIcon!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
