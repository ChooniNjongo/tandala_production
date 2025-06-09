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

          ],
        );
      },
    );
  }
}
