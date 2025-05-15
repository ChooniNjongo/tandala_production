import 'package:cwt_ecommerce_admin_panel/features/listing_process/all_listings/responsive_screens/listings_desktop.dart';
import 'package:cwt_ecommerce_admin_panel/features/listing_process/all_listings/responsive_screens/listings_mobile.dart';
import 'package:cwt_ecommerce_admin_panel/features/listing_process/all_listings/responsive_screens/listings_tablet.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/layouts/templates/site_layout.dart';

class ListingsScreen extends StatelessWidget {
  const ListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(desktop: ListingsDesktopScreen(), tablet: ListingsTabletScreen(), mobile: ListingsMobileScreen());
  }
}
