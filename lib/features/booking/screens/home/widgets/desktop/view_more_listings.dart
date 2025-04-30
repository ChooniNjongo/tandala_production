import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../controllers/property_controller.dart';

class ViewMoreListings extends StatelessWidget {
  const ViewMoreListings({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ListingsController());
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:isMobile? 8: 40),
      child: Obx(() {
        if (controller.isLoadingViewMore.value) {
          return TGridLayout(
              crossAxisCount: isMobile ? 1 : 3,
              mainAxisExtent: 294,
              itemCount: 12,
              itemBuilder: (_, index) => const TVerticalProductShimmer());
        }
        return const Center(child: SizedBox());
      }),
    );
  }
}
