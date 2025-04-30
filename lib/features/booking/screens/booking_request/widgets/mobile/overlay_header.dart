import 'package:flutter/material.dart';

import '../../../../../../common/widgets/overrlay_header/overlay_header.dart';
import '../../../../../../utils/constants/image_strings.dart';

class BookingRequestOverlayHeader extends StatelessWidget {
  const BookingRequestOverlayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: OverlayHeader(
        leftIcon: TImages.arrowLeft,
        leftIconColor: Colors.white,
        label: 'Book Now',
        rightIcon: TImages.shoppingCart,
        rightIconColor: Colors.transparent,
      ),
    );
  }
}
