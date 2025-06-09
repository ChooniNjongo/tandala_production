// home_desktop_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/cards/listing_card/listing_card.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../utils/constants/color_system.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/typography.dart';
import '../../../controllers/property_controller.dart';
import '../widgets/common/search_and_filters.dart';
import '../widgets/common/quick_filters.dart';

class HomeDesktopScreen extends StatelessWidget {
  const HomeDesktopScreen({super.key});

  double _calculateMainAxisExtent(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth > 600 ? 80 : 40;
    final availableWidth = screenWidth - horizontalPadding;

    int crossAxisCount;
    if (screenWidth > 1400) {
      crossAxisCount = 5;
    } else if (screenWidth > 1200) {
      crossAxisCount = 4;
    } else if (screenWidth > 900) {
      crossAxisCount = 3;
    } else if (screenWidth > 600) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 1;
    }

    final itemWidth = (availableWidth - ((crossAxisCount - 1) * TSizes.gridViewSpacing)) / crossAxisCount;
    final imageHeight = itemWidth * 0.75;
    const nameAndRatingHeight = 40.0;
    const distanceHeight = 20.0;
    const priceHeight = 25.0;
    const spacingHeight = 20.0;

    final totalHeight = imageHeight + nameAndRatingHeight + distanceHeight + priceHeight + spacingHeight;
    return totalHeight;
  }

  int _getCrossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1400) return 5;
    if (screenWidth > 1200) return 4;
    if (screenWidth > 900) return 3;
    if (screenWidth > 600) return 2;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    final propertyController = Get.put(ListingsController());
    final crossAxisCount = _getCrossAxisCount(context);
    final mainAxisExtent = _calculateMainAxisExtent(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 80, right: 80, top: 20, bottom: 24),
            child: TSearchAndFilters(),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QuickFilters(),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          Obx(() {
            if (propertyController.isLoading.value) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
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
                    horizontal: screenWidth > 600 ? 40 : 20,
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
          }),
        ],
      ),
    );
  }
}
