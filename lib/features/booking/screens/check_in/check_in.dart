import 'package:cwt_ecommerce_admin_panel/features/booking/screens/check_in/responsive_screens/check_in_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../home/responsive_screens/home_tablet.dart';

class CheckInScreen extends StatelessWidget {
  const CheckInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = Get.arguments;
    return TSiteTemplate(
      useLayout: false,
      desktop: CheckInMobileScreen(booking: booking),
      tablet: const HomeTabletScreen(),
      mobile: CheckInMobileScreen(booking: booking),
    );
  }
}
