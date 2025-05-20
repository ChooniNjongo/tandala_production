import 'package:cwt_ecommerce_admin_panel/features/booking/screens/bookings_history/responsive_screens/booking_desktop.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/screens/bookings_history/responsive_screens/bookings_mobile.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../home/responsive_screens/home_tablet.dart';

class BookingsHistoryScreen extends StatelessWidget {
  const BookingsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TSiteTemplate(
      useLayout: true,
      desktop: BookingsDesktopScreen(),
      tablet:  HomeTabletScreen(),
      mobile:  BookingsHistoryMobile(),
    );
  }
}
