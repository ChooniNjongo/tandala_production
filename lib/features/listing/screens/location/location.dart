import 'package:cwt_ecommerce_admin_panel/features/listing/screens/location/responsive_screens/add_another_room_prompt_mobile.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../../booking/screens/home/responsive_screens/home_tablet.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TSiteTemplate(
      useLayout: false,
      desktop: LocationMobileScreen(),
      tablet:  HomeTabletScreen(),
      mobile:  LocationMobileScreen(),
    );
  }
}
