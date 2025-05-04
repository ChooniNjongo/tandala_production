import 'package:flutter/material.dart';

import '../../../../../../features/booking/models/property/listing_model.dart';
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
    return RichText(
      text: TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: 'Starting at',
            style: TTypography.body14Regular.copyWith(
              color: TColors.textPrimary,
            ),
          ),
          TextSpan(
            text: ' K${listing.startingRoomPrice.toInt().toString()} ',
            style: TTypography.h4.copyWith(
              fontFamily: 'Lora',
              color: TColors.textPrimary,
            ),
          ),
          TextSpan(
            text: 'night',
            style: TTypography.body12Regular.copyWith(
              fontSize: 10,
              color: TColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
