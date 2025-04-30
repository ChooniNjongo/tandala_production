import 'package:cwt_ecommerce_admin_panel/features/booking/screens/booking_request/responsive_screens/booking_request_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../home/responsive_screens/home_tablet.dart';

class BookingRequestScreen extends StatelessWidget {
  const BookingRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final room = Get.arguments;
    return TSiteTemplate(
      useLayout: false,
      desktop: BookingRequestMobileScreen(room: room),
      tablet: const HomeTabletScreen(),
      mobile: BookingRequestMobileScreen(room: room),
    );
  }
}
