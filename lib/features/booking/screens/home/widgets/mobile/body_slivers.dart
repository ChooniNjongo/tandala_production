import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/widgets/mobile/quick_filters_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/cards/listing_card/listing_card.dart'; // Updated import
import '../../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../../common/widgets/layouts/headers/widgets/desktop/desktop_navbar.dart';
import '../../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../controllers/property_controller.dart';

class BodySlivers extends StatelessWidget {
  const BodySlivers({super.key});

  // Calculate main axis extent for mobile (same logic as desktop)
  double _calculateMainAxisExtent(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const horizontalPadding = 24.0; // Mobile padding
    final availableWidth = screenWidth - horizontalPadding;

    // Mobile typically uses 1 column, but can be 2 for larger mobile screens
    int crossAxisCount = screenWidth > 480 ? 2 : 1;

    final itemWidth = crossAxisCount == 1
        ? availableWidth
        : (availableWidth - TSizes.gridViewSpacing) / crossAxisCount;

    final imageHeight = itemWidth * 0.75; // Same aspect ratio as desktop
    const nameAndRatingHeight = 40.0;
    const distanceHeight = 20.0;
    const priceHeight = 25.0;
    const spacingHeight = 20.0;

    final totalHeight = imageHeight +
        nameAndRatingHeight +
        distanceHeight +
        priceHeight +
        spacingHeight;
    return totalHeight;
  }

  int _getCrossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 480 ? 2 : 1; // 2 columns for larger mobile screens, 1 for smaller
  }

  @override
  Widget build(BuildContext context) {
    final propertyController = Get.put(ListingsController());
    final isMobile = TDeviceUtils.isMobileScreen(context);
    final crossAxisCount = _getCrossAxisCount(context);
    final mainAxisExtent = _calculateMainAxisExtent(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Obx(() {
          if (propertyController.isLoading.value) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 40,
                vertical: 32,
              ),
              child: TGridLayout(
                crossAxisCount: crossAxisCount,
                mainAxisExtent: mainAxisExtent,
                mainAxisSpacing: 24, // Same as desktop
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                NavbarItem(
                  isSelected: false,
                  name: 'Apartments',
                  icon: TImages.apartment,
                  onPressed: () {},
                ),
                NavbarItem(
                  isSelected: true,
                  name: 'Hotels',
                  icon: TImages.hotel,
                  onPressed: () {},
                ),
                NavbarItem(
                  isSelected: false,
                  name: 'Lodges',
                  icon: TImages.lodge,
                  onPressed: () {},
                )
              ],
                        ),
            ),
              /// How do i stack a svg chevron right arrow at the end of the scrollable row,and dim the item of the filters thats right behind the arrow
              const SizedBox(width: double.infinity,child: QuickFiltersMobile()),
              const SizedBox(height: TSizes.spaceBtwSections / 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TGridLayout(
                  crossAxisCount: crossAxisCount,
                  mainAxisExtent: mainAxisExtent,
                  mainAxisSpacing: 4, // Same as desktop
                  itemCount: propertyController.listings.length,
                  itemBuilder: (_, index) => ListingCard( // Updated to use ListingCard
                    listing: propertyController.listings[index],
                  ),
                ),
              ),
              const SizedBox(height: 40), // Bottom spacing
            ],
          );
        });
      }, childCount: 1),
    );
  }
}