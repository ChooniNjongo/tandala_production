import 'package:flutter/material.dart';

class CascadeImageCard extends StatelessWidget {
  const CascadeImageCard({
    super.key,
    this.width,
    this.height,
    this.topRightRadius = 0.0,
    this.topLeftRadius = 0.0,
    this.bottomRightRadius = 0.0,
    this.bottomLeftRadius = 0.0,
    required this.image,
  });

  final double? width;
  final double? height;
  final double topRightRadius;
  final double topLeftRadius;
  final double bottomRightRadius;
  final double bottomLeftRadius;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeftRadius),
        topRight: Radius.circular(topRightRadius),
        bottomRight: Radius.circular(bottomRightRadius),
        bottomLeft: Radius.circular(bottomLeftRadius),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Image.asset(
          image,
          fit: BoxFit.cover, // Ensures the image covers the box
        ),
      ),
    );
  }
}
