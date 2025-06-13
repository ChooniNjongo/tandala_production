// listing_card.dart - Optimized for compact layout
import "package:cwt_ecommerce_admin_panel/common/widgets/cards/property_cards/mobile/widgets/listing_price.dart";
import "package:flutter/material.dart";
import "../../../../features/booking/models/property/listing_model.dart";
import "listing_image.dart";
import "listing_name_and_rating.dart";

class ListingCard extends StatelessWidget {
  const ListingCard({super.key, required this.listing});

  final ListingModel listing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;
        final imageHeight = cardWidth * 0.795; // 4:3 aspect ratio

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize:
              MainAxisSize.min, // Important: don't take up extra space
          children: [
            /// Listing Image - Fixed height based on width
            SizedBox(
              height: imageHeight,
              width: double.infinity,
              child: ListingImage(listing: listing),
            ),
            const SizedBox(height: 8), // Reduced spacing

            /// Listing Name and Rating - Fixed height
            ListingNameAndRating(listing: listing),
            const SizedBox(height: 2), // Reduced spa


            /// Listing Distance Widget - Fixed height
             Text(
              listing.city,
              style: const TextStyle(
                color: Color(0xFF6D6D6D),
                fontFamily: 'InterDisplay',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 1.4, // line-height of 140%
                letterSpacing: 0,
              ),
            ),
            /// Listing Price - Fixed height
            SizedBox(
              height: 25,
              child: ListingPriceAndViews(listing: listing),
            ),
          ],
        );
      },
    );
  }
}
