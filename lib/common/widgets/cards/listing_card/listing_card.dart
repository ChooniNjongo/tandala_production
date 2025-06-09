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
        return Column(
          children: [
            /// Listing Image
            ListingImage(listing: listing),
            const SizedBox(height: 12),

            /// Listing Name and Rating
            ListingNameAndRating(listing: listing),

            /// Listing Distance Widget
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListingDistance(listing: listing),
              ],
            ),

            /// Listing Price
            ListingPriceAndViews(listing: listing),
          ],
        );
      },
    );
  }
}
