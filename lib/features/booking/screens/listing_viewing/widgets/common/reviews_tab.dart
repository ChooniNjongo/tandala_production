import 'package:flutter/material.dart';
import '../../../../../../common/widgets/ratings/rating_progress_indicator.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../models/property/listing_model.dart';

class ReviewsTab extends StatelessWidget {
  final ListingModel listing;

  const ReviewsTab({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: isMobile ? TSizes.defaultSpace : 0,
            vertical: TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Overall Product Ratings
            Column(
              children: [
                TOverallProductRating(listing: listing),
                // TRatingBarIndicator(rating: listing.rating),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
