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
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .apply(fontWeightDelta: -1),
          ),
          TextSpan(
            text: ' K${listing.startingRoomPrice.toInt().toString()} ',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .apply(fontWeightDelta: -1),
          ),
          TextSpan(
            text: 'night',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .apply(fontWeightDelta: -1),
          ),
        ],
      ),
    );
  }
}
