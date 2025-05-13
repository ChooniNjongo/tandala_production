import 'package:flutter/material.dart';

import '../../../../../../features/booking/models/property/listing_model.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/typography.dart';

class ListingPrice extends StatelessWidget {
  const ListingPrice({
    super.key,
    required this.listing,
  });

  final ListingModel listing;

  @override
  Widget build(BuildContext context) {
    return               /// Price and Rating
      RichText(
        text: TextSpan(
          children: <InlineSpan>[
            TextSpan(
              text: 'Starting at',
              style: TTypography.body12Regular.copyWith(color: TColorSystem.n400),
            ),
            TextSpan(
              text:
              ' K${listing.startingRoomPrice.toInt().toString()} ',
              style: TTypography.h5.copyWith(
                fontSize: 14,
                color: TColors.textSecondary,
              ),
            ),
            TextSpan(
              text: 'night',
              style: TTypography.body12Regular.copyWith(
                fontSize: 10,
                color: TColors.textSecondary,
              ),
            ),
          ],
        ),
      );
  }
}
