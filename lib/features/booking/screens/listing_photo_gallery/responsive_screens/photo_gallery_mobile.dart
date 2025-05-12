import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/color_system.dart';
import '../../../models/property/listing_model.dart';
import '../widgets/photo_gallery_image.dart';

class PhotoGalleryMobileScreen extends StatelessWidget {
  final ListingModel listing;

  const PhotoGalleryMobileScreen({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            /// Photo Image Slider
            PhotoGalleryImageSlider(listing: listing),
          ],
        ),
      ),
    );
  }
}
