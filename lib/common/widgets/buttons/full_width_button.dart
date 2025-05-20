import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class TFullWidthElevatedButton extends StatelessWidget {
  const TFullWidthElevatedButton({
    super.key,
    required this.buttonLabel,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    this.backgroundColor = TColors.primary500,
    this.labelColor = TColors.white, // Add labelColor parameter
  });

  final String buttonLabel;
  final void Function()? onPressed;
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
        child: ElevatedButton(
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
