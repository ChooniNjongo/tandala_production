import 'package:flutter/material.dart';

import '../../../features/booking/models/property/listing_model.dart';
import '../../../features/booking/models/property/property_review.dart';
import '../../../features/booking/screens/listing_viewing/widgets/common/rating_star_rating_bars.dart';
import '../../../features/booking/screens/listing_viewing/widgets/common/user_review_card.dart';

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
    required this.listing,
  });

  final ListingModel listing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingStarRatingBars(listing: listing,),
        UserReviewCard(
          review: PropertyReview(
              listingId: '',
              bookingId: '',
              userId: '',
              userNameTruncated: 'Chooni',
              propertyName: '',
              dateTime: DateTime.now(),
              rating: 5,
              review:
                  'I love staying this property.Nice host.I love staying this property.Nice host.I love staying this property.Nice host.I love staying this property.Nice host.',
              reviewReply: ''),
        ),
        UserReviewCard(
          review: PropertyReview(
              listingId: '',
              bookingId: '',
              userId: '',
              userNameTruncated: 'Chooni',
              propertyName: '',
              dateTime: DateTime.now(),
              rating: 5,
              review: 'I love staying this property.Nice host.',
              reviewReply: ''),
        ),
        UserReviewCard(
          review: PropertyReview(
              listingId: '',
              bookingId: '',
              userId: '',
              userNameTruncated: 'Chooni',
              propertyName: '',
              dateTime: DateTime.now(),
              rating: 5,
              review: 'I love staying this property.Nice host.',
              reviewReply: ''),
        ),
      ],
    );
  }
}
