import 'package:flutter/material.dart';
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
