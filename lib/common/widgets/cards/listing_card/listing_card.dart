// listing_card.dart - Optimized for compact layout
import "package:cwt_ecommerce_admin_panel/common/widgets/cards/property_cards/mobile/widgets/listing_distance.dart";
import "package:cwt_ecommerce_admin_panel/common/widgets/cards/property_cards/mobile/widgets/listing_price.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "../../../../features/booking/models/property/listing_model.dart";
import "../../../../utils/constants/image_strings.dart";
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
        final imageHeight = cardWidth * 0.75; // 4:3 aspect ratio

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Important: don't take up extra space
          children: [
            /// Listing Image - Fixed height based on width
            SizedBox(
              height: imageHeight,
              width: double.infinity,
              child: ListingImage(listing: listing),
            ),
            const SizedBox(height: 8), // Reduced spacing

            /// Listing Name and Rating - Fixed height
            SizedBox(
              height: 40,
              child: ListingNameAndRating(listing: listing),
            ),
            const SizedBox(height: 4), // Reduced spacing

            /// Listing Distance Widget - Fixed height
            SizedBox(
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListingDistance(listing: listing),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4), // Reduced spacing

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
