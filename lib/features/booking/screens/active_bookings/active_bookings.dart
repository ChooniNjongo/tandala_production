import 'package:cwt_ecommerce_admin_panel/features/booking/screens/active_bookings/responsive_screens/active_bookings_mobile.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';

class ActiveBookingsScreen extends StatelessWidget {
  const ActiveBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TSiteTemplate(
      useLayout: true,
      desktop: ActiveBookingsMobile(),
      tablet:  ActiveBookingsMobile(),
      mobile:  ActiveBookingsMobile(),
    );
  }
}
