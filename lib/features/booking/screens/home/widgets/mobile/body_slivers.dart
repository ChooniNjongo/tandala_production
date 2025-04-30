import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/cards/property_cards/mobile/property_card_mobile.dart';
import '../../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../controllers/property_controller.dart';

class BodySlivers extends StatelessWidget {
  const BodySlivers({super.key});

  @override
  Widget build(BuildContext context) {
    final propertyController = Get.put(ListingsController());
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Obx(() {
          if (propertyController.isLoading.value) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: TGridLayout(
                crossAxisCount: isMobile ? 1 : 3,
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
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 12 : 40,
              vertical: 32,
            ),
            child: TGridLayout(
              crossAxisCount: isMobile ? 1 : 3,
              mainAxisExtent: 360,
              itemCount: propertyController.listings.length,
              itemBuilder:
                  (_, index) => PropertyCardMobile(
                    listing: propertyController.listings[index],
                  ),
            ),
          );
        });
      }, childCount: 1),
    );
  }
}
