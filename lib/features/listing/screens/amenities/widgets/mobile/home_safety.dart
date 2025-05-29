import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/section_input_list/section_input_list.dart';
import '../../../../../../common/widgets/section_input_list/widgets/input_list_item.dart';
import '../../../../controllers/amenities_step_controller.dart';

class HomeSafetySection extends StatelessWidget {
  const HomeSafetySection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AmenitiesStepController());
    return Column(
      children: [
        TSectionInputList(
          title: 'Home Safety',
          listOfListInputItems: [
            TInputListItem(
              inputListName: 'Smoke alarm',
              isSelected: controller.isSmokeAlarmSelected,
            ),
            TInputListItem(
              inputListName: 'Carbon monoxide alarm',
              isSelected: controller.isCarbonMonoxideAlarmSelected,
            ),
            TInputListItem(
              inputListName: 'Fire extinguisher',
              isSelected: controller.isFireExtinguisherSelected,
            ),
            TInputListItem(
              inputListName: 'First aid kit',
              isSelected: controller.isFirstAidKitSelected,
            ),
          ],
          seeAllLabel: '',
        ),
      ],
    );
  }
}
