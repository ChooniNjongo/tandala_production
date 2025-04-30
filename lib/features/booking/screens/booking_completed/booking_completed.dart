import 'package:cwt_ecommerce_admin_panel/features/booking/screens/booking_completed/responsive_screens/booking_completed_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../models/booking/booking.dart';

class BookingCompletedScreen extends StatelessWidget {
  const BookingCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = Get.arguments as Booking;
    return TSiteTemplate(
      useLayout: false,
      desktop: BookingCompletedMobileScreen(booking: booking),
      tablet: BookingCompletedMobileScreen(booking: booking),
      mobile: BookingCompletedMobileScreen(booking: booking),
    );
  }
}
