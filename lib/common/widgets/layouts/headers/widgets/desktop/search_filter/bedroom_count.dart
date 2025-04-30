import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../common/widgets/chips/pill.dart';
import '../../../../../../../common/widgets/texts/filter_title.dart';
import '../../../../../../../features/booking/controllers/search_filter_controller.dart';
import '../../../../../../../utils/constants/sizes.dart';
import 'filter_item.dart';

class BedRoomCount extends StatelessWidget {
  const BedRoomCount({
    super.key,
    required this.propertyFeature,
  });

  final String propertyFeature;

  @override
  Widget build(BuildContext context) {
    return const FilterItemLayout(
      filterName: FilterTitle(
        title: 'Bedroom',
      ),
      filter: BedRoomCountWidget(),
    );
  }
}

class BedRoomCountWidget extends StatelessWidget {
  const BedRoomCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFilterController());
    return Obx(
      () => Wrap(
        children: [
          TPill(
            title:  'Any',
            isSelected: controller.anyBedroomCountSelected.value,
            onTap: controller.onAnyBedroomCountSelected,
          ),
          TPill(
            title: '1',
            isSelected: controller.oneBedroomCountSelected.value,
            onTap: controller.onOneBedroomCountSelected,
          ),
          TPill(
            title: '2',
            isSelected: controller.twoBedroomCountSelected.value,
            onTap: controller.onTwoBedroomCountSelected,
          ),
          TPill(
            title: '3 or More',
            isSelected: controller.threeBedroomCountSelected.value,
            onTap: controller.onThreeBedroomCountSelected,
          ),
          const SizedBox(width: TSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
