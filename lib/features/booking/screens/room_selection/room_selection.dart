import 'package:cwt_ecommerce_admin_panel/features/booking/screens/room_selection/responsive_screens/room_selection_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../models/property/listing_model.dart';

class RoomSelectionScreen extends StatelessWidget {
  const RoomSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listing = Get.arguments as ListingModel;
    return TSiteTemplate(
      useLayout: false,
      desktop: RoomSelectionMobileScreen(listing: listing),
      tablet: RoomSelectionMobileScreen(listing: listing),
      mobile: RoomSelectionMobileScreen(listing: listing),
    );
  }
}
