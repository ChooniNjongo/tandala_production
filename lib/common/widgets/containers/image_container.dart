import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.svgImageName,
  });

  final String svgImageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 342,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child:  Center(
        child: SvgPicture.asset(
          svgImageName,
        ),
      ),
    );
  }
}
