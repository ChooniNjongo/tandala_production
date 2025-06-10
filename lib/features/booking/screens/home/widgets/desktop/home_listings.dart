import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/cards/listing_card/listing_card.dart';
import '../../../../../../common/widgets/cards/property_cards/mobile/property_card_mobile.dart';
import '../../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../controllers/property_controller.dart';


class HomeListings extends StatelessWidget {
  const HomeListings({
    super.key,
    required this.propertyController,
    required this.crossAxisCount,
    required this.mainAxisExtent,
    required this.screenWidth,
  });

  final ListingsController propertyController;
  final int crossAxisCount;
  final double mainAxisExtent;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (propertyController.isLoading.value) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 32),
          child: TGridLayout(
            crossAxisCount: crossAxisCount,
            mainAxisExtent: mainAxisExtent,
            mainAxisSpacing: 24,
            itemCount: 12,
            itemBuilder: (_, index) => const TVerticalProductShimmer(),
          ),
        );
      }

      if (propertyController.listings.isEmpty) {
        return Center(
          child: Text(
            'No Properties Found. Try another search criteria',
            style: TTypography.body14Regular.apply(
              color: TColorSystem.n200,
            ),
          ),
        );
      }

      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth > 600 ? 64 : 64,
              vertical: 32,
            ),
            child: TGridLayout(
              crossAxisCount: crossAxisCount,
              mainAxisExtent: mainAxisExtent,
              mainAxisSpacing: 4,
              itemCount: propertyController.listings.length,
              itemBuilder: (_, index) => ListingCard(
                listing: propertyController.listings[index],
              ),
            ),
          ),
          // _buildPagination(context, propertyController),
        ],
      );
    });
  }
}
