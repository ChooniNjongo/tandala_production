import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../../features/booking/controllers/location_controller.dart';
import '../../../../../../features/booking/controllers/property_controller.dart';
import '../../../../../../features/booking/models/property/listing_model.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/typography.dart';

class ListingDistance extends StatelessWidget {
  final ListingModel listing;
  const ListingDistance({super.key, required this.listing});

  @override
  @override
  Widget build(BuildContext context) {
    final locationController = Get.put(LocationController());
    final listingsController = Get.put(ListingsController());

    if (listing.distanceFromUser == null) {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: GestureDetector(
          onTap: () async {
            await locationController.getLocation();
            listingsController.searchListings();
          },
          child: Text(
            'See distance',
            style: TTypography.label12Regular.copyWith(
              color: TColors.accent,
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          '${listing.distanceFromUser!.round()} Kilometers away',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .apply(),
        ),
      );
    }
  }
}
