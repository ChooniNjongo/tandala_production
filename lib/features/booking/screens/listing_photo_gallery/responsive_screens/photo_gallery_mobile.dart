import 'package:flutter/material.dart';
import '../../../../../common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import '../../../models/property/listing_model.dart';
import '../widgets/photo_gallery_image.dart';

class PhotoGalleryMobileScreen extends StatelessWidget {
  final ListingModel listing;

  const PhotoGalleryMobileScreen({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumbs
            const TBreadcrumbsWithHeading(
                hideBreadcrumbs: true,
                returnToPreviousScreen: true,
                heading: 'Photo Gallery',
                breadcrumbItems: []),

            /// Photo Image Slider
            PhotoGalleryImageSlider(listing: listing),
          ],
        ),
      ),
    );
  }
}
