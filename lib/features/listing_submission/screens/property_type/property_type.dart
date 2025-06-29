import 'package:cwt_ecommerce_admin_panel/features/listing_submission/screens/property_type/responsive_screens/property_type_mobile.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../../booking/screens/home/responsive_screens/home_tablet.dart';

class PropertyTypeScreen extends StatelessWidget {
  const PropertyTypeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  const TSiteTemplate(
      useLayout: false,
      desktop: PropertyTypeMobileScreen(),
      tablet:  HomeTabletScreen(),
      mobile:  PropertyTypeMobileScreen(),
    );
  }
}
