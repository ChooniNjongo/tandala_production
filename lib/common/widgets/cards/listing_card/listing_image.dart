import 'package:cwt_ecommerce_admin_panel/common/widgets/icons/favorite_icon.dart';
import 'package:flutter/material.dart';

import '../../../../features/booking/models/property/listing_model.dart';

class ListingImage extends StatelessWidget {
  const ListingImage({super.key, required this.listing});

  final ListingModel listing;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 4 / 3, // Or choose 3/2 or 16/9 depending on layout
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              listing.getAllImages()[0],
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        Positioned(
            right: 12,
            top: 12,
            child: FavoriteIcon(propertyId: listing.listingId!))
      ],
    );
  }
}
