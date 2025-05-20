import 'package:flutter/material.dart';

import '../../../utils/constants/color_system.dart';
import '../../../utils/constants/typography.dart';

class TTextButton extends StatelessWidget {
  const TTextButton(
      {super.key,
      this.onPressed,
      required this.label,
      this.labelColor = TColorSystem.n200});

  final void Function()? onPressed;
  final String label;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 48,
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: TTypography.label14Regular.copyWith(color: labelColor),
            )));
  }
}
