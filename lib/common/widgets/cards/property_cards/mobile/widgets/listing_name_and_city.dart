import 'package:flutter/material.dart';

import '../../../../../../features/booking/models/property/listing_model.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/typography.dart';

class ListingName extends StatelessWidget {
  const ListingName({
    super.key,
    required this.listing,
  });

  final ListingModel listing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: SizedBox(
        // Adjust this width to fit your layout, or wrap in Flexible/Expanded
        child: Text.rich(
          TextSpan(
            children: <InlineSpan>[
              TextSpan(
                text: listing.propertyName,
                  style:TTypography.h4.copyWith(
                    color: TColorSystem.n100,
                  ),
              ),

            ],
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
