import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class ExtensibleFullWidthDivider extends StatelessWidget {
  const ExtensibleFullWidthDivider({
    super.key,
    this.large = false,
    this.medium = false,
    this.small = true,
  });

  final bool large;
  final bool medium;
  final bool small;

  @override
  Widget build(BuildContext context) {
    double height = 1; // Default to small

    if (large) {
      height = 4;
    } else if (medium) {
      height = 2;
    } else if (small) {
      height = 1;
    }

    return Divider(
      thickness: height,
      color: TColors.iconBorder,
    );
  }
}
