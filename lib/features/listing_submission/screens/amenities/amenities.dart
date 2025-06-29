import 'package:cwt_ecommerce_admin_panel/features/listing_submission/screens/amenities/responsive_screens/amenities_mobile.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../../booking/screens/home/responsive_screens/home_tablet.dart';

class AmenitiesScreen extends StatelessWidget {
  const AmenitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TSiteTemplate(
      useLayout: false,
      desktop: AmenitiesMobileScreen(),
      tablet:  HomeTabletScreen(),
      mobile:  AmenitiesMobileScreen(),
    );
  }
}
