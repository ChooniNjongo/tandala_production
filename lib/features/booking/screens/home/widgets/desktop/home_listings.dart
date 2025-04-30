import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/cards/property_cards/mobile/property_card_mobile.dart';
import '../../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../controllers/property_controller.dart';

class HomeListings extends StatelessWidget {
  const HomeListings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ListingsController());
    final isMobile = TDeviceUtils.isMobileScreen(context);

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:isMobile? 12: 40),
      child: Obx(() {
        if (controller.isLoading.value) {
          return TGridLayout(
              crossAxisCount: isMobile ? 1 : 3,
              mainAxisExtent: 294,
              itemCount: 12,
              itemBuilder: (_, index) => const TVerticalProductShimmer());
        }
        if (controller.listings.isEmpty) {
          return Center(
              child: Text('No Data Found',
                  style: Theme.of(context).textTheme.bodyMedium));
        }

        /// Show only the first 18 or less if list has less than 18 elements
        return TGridLayout(
          crossAxisCount: isMobile ? 1 : 3,
          mainAxisExtent: 294,
          itemCount: controller.listings.length,
          itemBuilder: (_, index) =>
              PropertyCardMobile(listing: controller.listings[index]),
        );
      }),
    );
  }
}
