import 'package:cwt_ecommerce_admin_panel/features/listing/screens/description/responsive_screens/description_mobile.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../../booking/screens/home/responsive_screens/home_tablet.dart';

class DescriptionsScreen extends StatelessWidget {
  const DescriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TSiteTemplate(
      useLayout: false,
      desktop: DescriptionMobileScreen(),
      tablet:  HomeTabletScreen(),
      mobile:  DescriptionMobileScreen(),
    );
  }
}
