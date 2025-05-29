import 'package:cwt_ecommerce_admin_panel/features/listing/screens/listings/responsive_screens/listings_mobile.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../../booking/screens/home/responsive_screens/home_tablet.dart';

class ListingsScreen extends StatelessWidget {
  const ListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TSiteTemplate(
      useLayout: false,
      desktop: ListingsMobileScreen(),
      tablet:  HomeTabletScreen(),
      mobile:  ListingsMobileScreen(),
    );
  }
}
