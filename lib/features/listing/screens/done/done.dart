import 'package:cwt_ecommerce_admin_panel/features/listing/screens/done/responsive_screens/done_mobile.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../../booking/screens/home/responsive_screens/home_tablet.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TSiteTemplate(
      useLayout: false,
      desktop: DoneMobileScreen(),
      tablet:  HomeTabletScreen(),
      mobile:  DoneMobileScreen(),
    );
  }
}
