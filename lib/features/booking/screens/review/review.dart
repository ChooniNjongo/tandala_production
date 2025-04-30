import 'package:cwt_ecommerce_admin_panel/features/booking/screens/review/responsive_screens/review_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../home/responsive_screens/home_tablet.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = Get.arguments;
    return TSiteTemplate(
      useLayout: false,
      desktop: ReviewMobileScreen(
        booking: booking,
      ),
      tablet: const HomeTabletScreen(),
      mobile: ReviewMobileScreen(
        booking: booking,
      ),
    );
  }
}
