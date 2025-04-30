import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../common/widgets/texts/filter_title.dart';
import '../../../../../../../features/booking/controllers/search_filter_controller.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../chips/pill.dart';
import 'filter_item.dart';

class BathRoomCount extends StatelessWidget {
  const BathRoomCount({
    super.key,
    required this.propertyFeature,
  });

  final String propertyFeature;

  @override
  Widget build(BuildContext context) {
    return const FilterItemLayout(
      filterName: FilterTitle(
        title: 'Bathroom',
      ),
      filter: BathroomCountWidget(),
    );
  }
}

class BathroomCountWidget extends StatelessWidget {
  const BathroomCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFilterController());
    return Obx(
      () => Wrap(
        children: [
          TPill(
            title: 'Any',
            isSelected: controller.anyBathroomCountSelected.value,
            onTap: controller.onAnyBathroomCountSelected,
          ),
          TPill(
            title: '1',
            isSelected: controller.oneBathroomCountSelected.value,
            onTap: controller.onOneBathroomCountSelected,
          ),
          TPill(
            title: '2',
            isSelected: controller.twoBathroomCountSelected.value,
            onTap: controller.onTwoBathroomCountSelected,
          ),
          TPill(
            title: '3 or More',
            isSelected: controller.threeBathroomCountSelected.value,
            onTap: controller.onThreeBathroomCountSelected,
          ),
          const SizedBox(
            width: TSizes.spaceBtwSections,
          ),
        ],
      ),
    );
  }
}
