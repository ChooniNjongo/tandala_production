import 'package:cwt_ecommerce_admin_panel/utils/constants/color_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../features/booking/controllers/location_controller.dart';
import '../../../../../../features/booking/controllers/property_controller.dart';
import '../../../../../../features/booking/models/property/listing_model.dart';
import '../../../../../../routes/routes.dart';
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
      return GestureDetector(
          onTap: () async {
            await locationController.getLocation();
            listingsController.searchListings();
            Get.toNamed(TRoutes.places);
          },
          child: const Text(
            'See distance',
            style: TextStyle(
              color: Color(0xFF6D6D6D),
              fontFamily: 'Inter Display',
              fontWeight: FontWeight.w400,
              fontSize: 13,
              height: 1.4, // line-height of 140%
              letterSpacing: 0,
            ),
          ));
    } else {
      return Text(
        '${listing.distanceFromUser!.round()} Kilometers away',
        style: const TextStyle(
          color: Color(0xFF6D6D6D),
          fontFamily: 'Inter Display',
          fontWeight: FontWeight.w400,
          fontSize: 13,
          height: 1.4, // line-height of 140%
          letterSpacing: 0,
        ),
      );
    }
  }
}
