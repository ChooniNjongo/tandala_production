import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../common/widgets/chips/pill.dart';
import '../../../../../../../common/widgets/texts/filter_title.dart';
import '../../../../../../../features/booking/controllers/search_filter_controller.dart';
import '../../../../../../../utils/constants/sizes.dart';
import 'filter_item.dart';

class BedCount extends StatelessWidget {
  const BedCount({
    super.key,
    required this.propertyFeature,
  });

  final String propertyFeature;

  @override
  Widget build(BuildContext context) {
    return const FilterItemLayout(
      filterName: FilterTitle(
        title: 'Beds',
      ),
      filter: BedCountWidget(),
    );
  }
}

class BedCountWidget extends StatelessWidget {
  const BedCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFilterController());
    return Obx(
      () => Wrap(
        children: [
          TPill(
            title: 'Any',
            isSelected: controller.anyBedCountSelected.value,
            onTap: controller.onAnyBedCountSelected,
          ),
          TPill(
            title: '1',
            isSelected: controller.oneBedCountSelected.value,
            onTap: controller.onOneBedCountSelected,
          ),
          TPill(
            title: '2',
            isSelected: controller.twoBedCountSelected.value,
            onTap: controller.onTwoBedCountSelected,
          ),
          TPill(
            title: '3 or More',
            isSelected: controller.threeBedCountSelected.value,
            onTap: controller.onThreeBedCountSelected,
          ),
          const SizedBox(width: TSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
