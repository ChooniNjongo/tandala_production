import 'package:cwt_ecommerce_admin_panel/utils/constants/color_system.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/typography.dart';
import 'package:flutter/material.dart';

class TPageHeading extends StatelessWidget {
  const TPageHeading({
    super.key,
    required this.heading,
    this.rightSideWidget,
  });

  final String heading;
  final Widget? rightSideWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(heading,
            style: TTypography.body16Bold.copyWith(color: TColorSystem.n200),),
        rightSideWidget ?? const SizedBox(),
      ],
    );
  }
}
