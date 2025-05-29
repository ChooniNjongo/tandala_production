import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/typography.dart';

class TExtensibleHugContentButton extends StatelessWidget {
  final String buttonLabel;
  final Function() onPressed;
  final EdgeInsetsGeometry contentPadding;
  final Color? backgroundColor;
  final Color? buttonLabelColor;
  final String? leftIcon;
  final String? rightIcon;
  final bool small;
  final bool isDisabled; // New property
  final double width; // New property

  const TExtensibleHugContentButton({
    super.key,
    required this.buttonLabel,
    required this.onPressed,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 48,
      vertical: 0,
    ),
    this.backgroundColor = TColors.primary500,
    this.leftIcon,
    this.rightIcon,
    this.buttonLabelColor = Colors.white,
    this.small = false,
    this.isDisabled = false,
    this.width = 160, // Default to false
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed, // Disable if true
        style: ElevatedButton.styleFrom(
          backgroundColor:
          isDisabled
              ? TColors.grey.withOpacity(0.5) // or whatever disabled color
              : backgroundColor,
        ),
        child: Padding(
          padding: contentPadding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leftIcon != null) ...[
                SvgPicture.asset(leftIcon!),
                const SizedBox(width: TSizes.spaceBtwItems / 2),
              ],
              Text(
                buttonLabel,
                textAlign: TextAlign.center,
                style: TTypography.h5.copyWith(
                  color:
                  isDisabled
                      ? Colors.white.withOpacity(0.5)
                      : buttonLabelColor,
                ),
              ),
              if (rightIcon != null) ...[
                const SizedBox(width: TSizes.spaceBtwItems / 2),
                SvgPicture.asset(rightIcon!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
