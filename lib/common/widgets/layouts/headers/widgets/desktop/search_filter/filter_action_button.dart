import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../features/booking/controllers/search_filter_controller.dart';
import '../../../../../../../routes/routes.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../loaders/MySpinKitLoadingIndicator.dart';

class FilterActionButtons extends StatelessWidget {
  const FilterActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFilterController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: controller.clearFilter,
          child: const Text(
            "Clear all",
            style: TextStyle(
              fontFamily: 'InterDisplay',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 1.4, // 140% line height
              letterSpacing: 0,
              color: Color(0xFF888888),
            ),
          ),
        ),
        SizedBox(
          width: 160,
          height: 44,
          child: ElevatedButton(
            onPressed: () {
              Get.offAllNamed(TRoutes.searchResults);
            }, //Take us to search results screen,

            child: Obx(
              () => controller.isLoading.value
                  ? const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: TSizes.spaceBtwItems,
                      ),
                      child: MySpinKitLoadingIndicator(),
                    )
                  : Text(
                      'Show  ${controller.listings.length} offers',
                      style: const TextStyle(
                        fontFamily: 'InterDisplay',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.4, // 140% line height
                        letterSpacing: 0,
                        color: TColors.white,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
