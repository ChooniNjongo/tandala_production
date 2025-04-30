import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

/// A container widget with rounded corners and customizable properties.
class TRoundedContainer extends StatelessWidget {
  /// Create a rounded container with customizable properties.
  ///
  /// Parameters:
  ///   - width: The width of the container.
  ///   - height: The height of the container.
  ///   - radius: The border radius for the rounded corners.
  ///   - padding: The padding inside the container.
  ///   - margin: The margin around the container.
  ///   - child: The widget to be placed inside the container.
  ///   - backgroundColor: The background color of the container.
  ///   - borderColor: The color of the container's border.
  ///   - showBorder: A flag to determine if the container should have a border.
  ///   - elevation: The elevation (shadow intensity) of the container.
  const TRoundedContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin,
    this.showShadow = false,
    this.showBorder = false,
    this.padding = const EdgeInsets.all(TSizes.md),
    this.borderColor = TColors.borderPrimaryDark,
    this.radius = TSizes.cardRadiusLg,
    this.backgroundColor = Colors.transparent,
    this.onTap,
    this.borderWidth = 1.0,
    this.elevation = 0.0,
  });

  final Widget? child;
  final double radius;
  final double? width;
  final double? height;
  final double borderWidth;
  final bool showBorder;
  final bool showShadow;
  final Color borderColor;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final Color backgroundColor;
  final void Function()? onTap;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder ? Border.all(color: borderColor, width: borderWidth) : null,
          boxShadow: elevation > 0
              ? [
            BoxShadow(
              color: TColors.jetBlack.withOpacity(0.25),
              spreadRadius: elevation,
              blurRadius: elevation,
              offset: const Offset(0, 3),
            ),
          ]
              : [],
        ),
        child: child,
      ),
    );
  }
}
