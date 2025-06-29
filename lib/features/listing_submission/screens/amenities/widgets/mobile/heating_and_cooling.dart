import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/section_input_list/section_input_list.dart';
import '../../../../../../common/widgets/section_input_list/widgets/input_list_item.dart';
import '../../../../controllers/amenities_step_controller.dart';

class HeatingAndCoolingSection extends StatelessWidget {
  const HeatingAndCoolingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AmenitiesStepController());
    return Column(
      children: [
        TSectionInputList(
          title: 'Heating And Cooling',
          listOfListInputItems: [
            TInputListItem(
              inputListName: 'Air conditioner',
              isSelected: controller.isAirConditionerSelected,
            ),
            TInputListItem(
              inputListName: 'Heating',
              isSelected: controller.isHeatingSelected,
            ),
          ],
          seeAllLabel: '',
        ),
      ],
    );
  }
}
