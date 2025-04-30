import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../common/widgets/chips/pill.dart';
import '../../../../../../../features/booking/controllers/search_filter_controller.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_strings.dart';
import 'filter_section_title.dart';

class SortBy extends StatelessWidget {
  const SortBy({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFilterController());
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FilterSectionTitle(title: TTexts.sortBy),
          const SizedBox(height: TSizes.spaceBtwSections / 2),
          const FilterSectionSubtitle(subTitle: TTexts.sortBySubtitle),
          const SizedBox(height: TSizes.spaceBtwSections / 2),
          Wrap(
            children: [
              TPill(
                  title: TTexts.highPriceSorting,
                  isSelected: controller.isPriceHighToLowSelected.value,
                  onTap: controller.onIsPriceHighToLowTapped),

              TPill(
                  title: TTexts.discountSorting,
                  isSelected: controller.isDiscountSelected.value,
                  onTap: controller.onIsDiscountSelectedTapped),

              TPill(
                  title: TTexts.lowPriceSorting,
                  isSelected: controller.isPriceLowToHighSelected.value,
                  onTap: controller.onIsPriceLowToHighTapped),
            ],
          ),

        ],
      ),
    );
  }
}
