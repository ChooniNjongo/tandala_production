import 'package:cwt_ecommerce_admin_panel/features/booking/screens/availability_check/responsive_screens/availability_check_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../models/booking/booking.dart';
import '../home/responsive_screens/home_tablet.dart';

class AvailabilityCheckScreen extends StatelessWidget {
  const AvailabilityCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = Get.arguments as Booking;
    return   TSiteTemplate(
      useLayout: false,
      desktop: AvailabilityCheckScreenMobile(booking: booking,),
      tablet:  const HomeTabletScreen(),
      mobile:  AvailabilityCheckScreenMobile(booking: booking,),
    );
  }
}
