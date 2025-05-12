import 'package:flutter/material.dart';

import '../../../utils/constants/color_system.dart';
import '../../../utils/constants/typography.dart';

class TTextButton extends StatelessWidget {
  const TTextButton(
      {super.key,
      this.onPressed,
      required this.label,
      this.labelColor = TColorSystem.n200,  this.showIcon = false, this.icon = Icons.tab});

  final void Function()? onPressed;
  final String label;
  final Color labelColor;
  final bool? showIcon;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showIcon!)
          GestureDetector(
            onTap: onPressed,
            child: Icon(
              icon!,
              color: Colors.redAccent,
              size: 20, // optionally control the size
            ),
          ),

        TextButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: TTypography.label14Regular.copyWith(color: labelColor),
            )),
      ],
    );
  }
}
