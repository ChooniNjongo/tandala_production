import 'package:cwt_ecommerce_admin_panel/features/booking/screens/listing_viewing/responsive_screens/listing_viewing_desktop.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/screens/listing_viewing/responsive_screens/listing_viewing_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../models/property/listing_model.dart';
import '../home/responsive_screens/home_tablet.dart';

class ListingViewingScreen extends StatelessWidget {
  const ListingViewingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments as a Map
    final Map<String, dynamic> args = Get.arguments ?? {'isEditing': false};

    // Extract individual arguments
    final bool isEditing = args['isEditing'] ?? false;
    final ListingModel listing = args['listing'];

    return TSiteTemplate(
      useLayout: false,
      desktop: ListingViewingDesktopScreen(
        isEditing: isEditing,
        listing: listing,
      ),
      tablet: const HomeTabletScreen(),
      mobile: ListingViewingMobileScreen(
        isEditing: isEditing,
        listing: listing,
      ),
    );
  }
}
