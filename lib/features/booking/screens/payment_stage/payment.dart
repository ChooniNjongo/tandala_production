import 'package:cwt_ecommerce_admin_panel/features/booking/screens/payment_stage/responsive_screens/payment_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../models/booking/booking.dart';
import '../home/responsive_screens/home_tablet.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final booking = Get.arguments as Booking;
    return TSiteTemplate(
      useLayout: false,
      desktop: PaymentMobileScreen(booking: booking),
      tablet: const HomeTabletScreen(),
      mobile: PaymentMobileScreen(booking: booking),
    );
  }
}
