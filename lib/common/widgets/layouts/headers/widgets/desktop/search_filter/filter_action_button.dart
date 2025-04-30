import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../features/booking/controllers/search_filter_controller.dart';
import '../../../../../../../routes/routes.dart';
import '../../../../../../../utils/constants/color_system.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/typography.dart';
import '../../../../../loaders/MySpinKitLoadingIndicator.dart';

class FilterActionButtons extends StatelessWidget {
  const FilterActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFilterController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 0.4,
          width: double.infinity,
          color: const Color(0xFF404747),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: controller.clearFilter,
                child: Text(
                  "Clear all",
                  style: TTypography.body14Bold.copyWith(
                    color: TColorSystem.n400,
                  ),
                ),
              ),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(TRoutes.searchResults);
                  }, //Take us to search results screen,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.primary500,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.spaceBtwItems,
                    ),
                    child: Obx(
                      () => controller.isLoading.value
                          ? const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: TSizes.spaceBtwItems,
                              ),
                              child: MySpinKitLoadingIndicator(),
                            )
                          : Text(
                              'Show  ${controller.listings.length} Offers',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(fontSizeFactor: 1.1),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
