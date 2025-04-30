import 'package:flutter/material.dart';

import '../../../../utils/constants/image_strings.dart';
import 'nav_svg.dart';

class BookingsIcon extends StatelessWidget {
  const BookingsIcon({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return TSvg(
      height: 24,
      isSelected: isSelected,
      activeImage: TImages.bookingActive,
      inActiveImage: TImages.bookingInactive,
    );

  }
}
