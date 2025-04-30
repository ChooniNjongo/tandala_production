import 'package:cwt_ecommerce_admin_panel/features/booking/screens/listing_photo_gallery/responsive_screens/photo_gallery_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/layouts/templates/site_layout.dart';

class PhotoGalleryScreen extends StatelessWidget {
  const PhotoGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listing = Get.arguments;
    return TSiteTemplate(
      useLayout: false,
      desktop: PhotoGalleryMobileScreen(listing: listing,),
      tablet: PhotoGalleryMobileScreen(listing: listing,),
      mobile: PhotoGalleryMobileScreen(listing: listing,),
    );
  }
}
