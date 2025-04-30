import 'package:flutter/material.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/property/listing_model.dart';
import '../../../../models/property/property_review.dart';
import '../common/rating_star_rating_bars.dart';
import '../common/user_review_card.dart';

class ReviewsTabDesktop extends StatelessWidget {
  final ListingModel listing;

  const ReviewsTabDesktop({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Rating Here ie Icon and rating bars
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: TSizes.spaceBtwSections * 2,
              ),
              RatingStarRatingBars(
                listing: listing,
              ),
            ],
          ),
        ),

        /// Guest Reviews
        Expanded(
          flex: 4,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: TSizes.spaceBtwSections * 2,
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
                      review:
                          'I love staying this property.Nice host.I love staying this property.Nice host.I love staying this property.Nice host.I love staying this property.Nice host.',
                      reviewReply: ''),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
