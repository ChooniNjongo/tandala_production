import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/cards/property_cards/mobile/property_card_mobile.dart';
import '../../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/property_controller.dart';

class HomeListingsMobile extends StatelessWidget {
  const HomeListingsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ListingsController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Obx(() {
        if (controller.isLoading.value) {
          return TGridLayout(
              mainAxisExtent: 294,
              itemCount: 4,
              itemBuilder: (_, index) => const TVerticalProductShimmer());
        }
        if (controller.listings.isEmpty) {
          return Center(
              child: Text('No Data Found',
                  style: Theme.of(context).textTheme.bodyMedium));
        }
        return TGridLayout(
          mainAxisExtent: 294,
          itemCount: controller.listings.length,
          itemBuilder: (_, index) =>
              PropertyCardMobile(listing: controller.listings[index]),
        );
      }),
    );
  }
}
