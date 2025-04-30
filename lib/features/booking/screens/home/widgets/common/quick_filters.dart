import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/widgets/common/quick_filters_shimmer.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/widgets/common/secondary_home_filters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../controllers/property_controller.dart';

class QuickFilters extends StatelessWidget {
  const QuickFilters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ListingsController());
    return TRoundedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 0),
      showShadow: false,
      radius: 0,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            Expanded(
                flex: 6,
                child: controller.isLoading.value
                    ? const QuickFiltersShimmer()
                    : const SecondaryFilters()),
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
