import 'package:cwt_ecommerce_admin_panel/features/booking/screens/cancelled_booking/responsive_screens/cancelled_booking_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../models/booking/booking.dart';

class CancelledBookingScreen extends StatelessWidget {
  const CancelledBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = Get.arguments as Booking;
    return TSiteTemplate(
      useLayout: false,
      desktop: CancelledBookingMobileScreen(booking: booking),
      tablet: CancelledBookingMobileScreen(booking: booking),
      mobile: CancelledBookingMobileScreen(booking: booking),
    );
  }
}
