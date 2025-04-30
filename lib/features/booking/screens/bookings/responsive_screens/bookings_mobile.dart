import 'package:flutter/material.dart';

import '../../../../../common/pages/action.dart';
import '../../../../../common/widgets/overrlay_header/overlay_header.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../widgets/mobile/body.dart';

class BookingsMobileScreen extends StatelessWidget {
  const BookingsMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ActionPage(
      overlayHeader: OverlayHeader(
        mainHeader: true,
        label: "Bookings",
        rightIcon: TImages.shoppingCart,
        rightIconColor: Colors.transparent,
      ),
      body: BookingsBody(),
    );
  }
}
