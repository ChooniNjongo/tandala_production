import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class FullWidthOutlineButton extends StatelessWidget {
  const FullWidthOutlineButton({
    super.key,
    required this.buttonLabel,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpaceDesktop, vertical: 0),
    this.backgroundColor = Colors.transparent,
    this.labelColor = TColors.white, // Add labelColor parameter
  });

  final String buttonLabel;
  final Function() onPressed;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final Color labelColor; // Add labelColor property

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
          onPressed: onPressed,
          child: Text(
            buttonLabel,
            style: TextStyle(color: labelColor), // Apply labelColor
          ),
        ),
      ),
    );
  }
}
