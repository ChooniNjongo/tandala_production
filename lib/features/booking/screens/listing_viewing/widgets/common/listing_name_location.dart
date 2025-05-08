import 'package:cwt_ecommerce_admin_panel/utils/constants/typography.dart';
import 'package:flutter/material.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../models/property/listing_model.dart';

class ListingNameLocation extends StatelessWidget {
  const ListingNameLocation({super.key, required this.listing});

  final ListingModel listing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(" ${listing.city}",
            style: TTypography.h3.copyWith(
            //  fontFamily: 'CormorantGaramond',
              color: TColorSystem.n200,
            )),
      ],
    );
  }
}
