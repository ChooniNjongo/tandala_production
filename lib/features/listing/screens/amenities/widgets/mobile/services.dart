import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/section_input_list/section_input_list.dart';
import '../../../../../../common/widgets/section_input_list/widgets/input_list_item.dart';
import '../../../../controllers/amenities_step_controller.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AmenitiesStepController());
    return Column(
      children: [
        TSectionInputList(
          title: 'Services',
          listOfListInputItems: [
            TInputListItem(
              inputListName: 'Smoking',
              isSelected: controller.isSmokingSelected,
            ),
            TInputListItem(
              inputListName: 'Cleaning available during stay',
              isSelected: controller.isCleaningAvailableDuringStaySelected,
            ),
          ],
          seeAllLabel: '',
        ),
      ],
    );
  }
}
