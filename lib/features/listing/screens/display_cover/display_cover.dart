import 'package:cwt_ecommerce_admin_panel/features/listing/screens/display_cover/responsive_screens/display_cover_mobile.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../../booking/screens/home/responsive_screens/home_tablet.dart';

class DisplayCoverScreen extends StatelessWidget {
  const DisplayCoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TSiteTemplate(
      useLayout: false,
      desktop: DisplayCoverMobileScreen(),
      tablet:  HomeTabletScreen(),
      mobile:  DisplayCoverMobileScreen(),
    );
  }
}
