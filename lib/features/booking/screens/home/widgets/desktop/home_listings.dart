import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/cards/listing_card/listing_card.dart';
import '../../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../controllers/property_controller.dart';
import '../common/pagination_navigation.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
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
        return Column(
          children: [
            const SizedBox(height: 80),
            Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.search_off,
                    size: 64,
                    color: TColorSystem.n200,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No Properties Found',
                    style: TTypography.h3.apply(
                      color: TColorSystem.n300,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Try adjusting your search criteria or explore different filters',
                    style: TTypography.body14Regular.apply(
                      color: TColorSystem.n200,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        );
      }

      return Column(
        children: [


          // Listings Grid
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth > 600 ? TSizes.defaultSpaceDesktop : 32,
              vertical: 16,
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

          // Pagination Navigation
          if (propertyController.totalPages.value > 1)
            PaginationNavigation(
              currentPage: propertyController.currentPage.value + 1, // Convert to 1-based
              totalPages: propertyController.totalPages.value,
              onPageChanged: (page) {
                propertyController.navigateToPage(page - 1); // Convert to 0-based
              },
            ),


          // Bottom spacing
          const SizedBox(height: 40),
        ],
      );
    });
  }
}