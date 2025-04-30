import 'package:flutter/material.dart';

import '../../../../../../utils/constants/typography.dart';
import '../../../../models/property/listing_model.dart';

class ListingHeader extends StatelessWidget {
  const ListingHeader({super.key, required this.listing});

  final ListingModel listing;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${listing.propertyName}, ${listing.city}",
      style: TTypography.h4.copyWith(fontSize: 20,fontWeight: FontWeight.normal),
    );
  }
}
