import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/section_input_list/section_input_list.dart';
import '../../../../../../common/widgets/section_input_list/widgets/input_list_item.dart';
import '../../../../controllers/amenities_step_controller.dart';

class ViewsSection extends StatelessWidget {
  const ViewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AmenitiesStepController());
    return Column(
      children: [
        TSectionInputList(
          title: 'Views',
          listOfListInputItems: [
            TInputListItem(inputListName: 'Ocean', isSelected: controller.isOceanSelected),
            TInputListItem(inputListName: 'Harbor', isSelected: controller.isHarborSelected),
            TInputListItem(inputListName: 'Mountain', isSelected: controller.isMountainSelected),
            TInputListItem(inputListName: 'City skyline', isSelected: controller.isCitSkylineSelected),
          ],
          seeAllLabel: '',
        ),
      ],
    );
  }
}
