import 'package:flutter/material.dart';

import '../../../../../../features/booking/models/property/listing_model.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';

class ListingRating extends StatelessWidget {
  const ListingRating({
    super.key,
    required this.listing,
  });

  final ListingModel listing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            color: TColors.accent,
            size: 16,
          ),
          const SizedBox(width: TSizes.spaceBtwItems / 4),
          Column(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: listing.rating.toString(),
                      style: TTypography.label14Bold.copyWith(
                        fontFamily: 'Lora',
                        color: TColors.textPrimary,
                      ),
                    ),
                    //   TextSpan(text: property.rating.toString() != 0.0.toString() ? property.rating.toString(): "",style: Theme.of(context).textTheme.labelMedium)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
