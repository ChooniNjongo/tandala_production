import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/constants/color_system.dart';

class TShimmerEffect extends StatelessWidget {
  const TShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 12,
    this.color,
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: TColors.secondaryBackground2,
      highlightColor: TColors.secondaryBackground2,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (TColors.secondaryBackground2),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
