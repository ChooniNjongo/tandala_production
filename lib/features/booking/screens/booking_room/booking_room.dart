import 'package:cwt_ecommerce_admin_panel/features/booking/screens/booking_room/responsive_screens/booking_room_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';

class BookingRoomScreen extends StatelessWidget {
  const BookingRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = Get.arguments;

    return TSiteTemplate(
      useLayout: false,
      desktop: BookingRoomMobileScreen(booking: booking),
      tablet: BookingRoomMobileScreen(booking: booking),
      mobile: BookingRoomMobileScreen(booking: booking),
    );
  }
}
