import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/widgets/common/quick_filters.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/cards/listing_card/listing_card.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../utils/constants/color_system.dart';
import '../../../../../utils/constants/typography.dart';
import '../../../controllers/property_controller.dart';
import '../widgets/common/search_and_filters.dart';

class HomeDesktopScreen extends StatelessWidget {
  const HomeDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final propertyController = Get.put(ListingsController());
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
          //

          Obx(() {
            if (propertyController.isLoading.value) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: TGridLayout(
                  crossAxisCount: 4,
                  mainAxisExtent: 340,
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

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 32,
              ),
              child: TGridLayout(
                crossAxisCount: 4,
                mainAxisExtent: 352,
                itemCount: propertyController.listings.length,
                itemBuilder: (_, index) => ListingCard(
                  listing: propertyController.listings[index],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
