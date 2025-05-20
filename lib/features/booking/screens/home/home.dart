import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/responsive_screens/home_desktop.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/responsive_screens/home_mobile.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/responsive_screens/home_tablet.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/layouts/templates/site_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      useLayout: true,
      desktop: HomeDesktopScreen(),
      tablet:  const HomeTabletScreen(),
      mobile:  const HomeMobileScreen(),
    );
  }
}
