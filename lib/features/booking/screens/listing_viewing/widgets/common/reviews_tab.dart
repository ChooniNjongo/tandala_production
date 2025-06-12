import 'package:flutter/material.dart';
import '../../../../../../common/widgets/ratings/rating_progress_indicator.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/property/listing_model.dart';

class ReviewsTab extends StatelessWidget {
  final ListingModel listing;

  const ReviewsTab({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(
            TSizes.defaultSpaceDesktop),
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
