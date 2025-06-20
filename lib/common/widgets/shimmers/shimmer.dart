import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../utils/constants/color_system.dart';
import '../../../utils/constants/colors.dart';

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
      baseColor: TColors.secondaryBackground,
      highlightColor:TColors.primaryBackground,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (TColors.primaryBackground),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
