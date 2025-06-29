import 'package:cwt_ecommerce_admin_panel/features/listing_submission/screens/name_and_city/responsive_screens/name_and_city_mobile.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../../booking/screens/home/responsive_screens/home_tablet.dart';

class NameAndCityScreen extends StatelessWidget {
  const NameAndCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TSiteTemplate(
      useLayout: false,
      desktop: NameAndCityMobileScreen(),
      tablet:  HomeTabletScreen(),
      mobile:  NameAndCityMobileScreen(),
    );
  }
}
