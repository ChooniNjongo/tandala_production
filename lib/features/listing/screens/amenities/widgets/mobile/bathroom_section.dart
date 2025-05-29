import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/section_input_list/section_input_list.dart';
import '../../../../../../common/widgets/section_input_list/widgets/input_list_item.dart';
import '../../../../controllers/amenities_step_controller.dart';

class BathroomSection extends StatelessWidget {
  const BathroomSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AmenitiesStepController());
    return Column(
      children: [
        TSectionInputList(
          title: 'Bathroom',
          listOfListInputItems: [
            TInputListItem(inputListName: 'Hair dryer', isSelected: controller.isHairDryerSelected),
            TInputListItem(inputListName: 'Cleaning Products', isSelected: controller.isCleaningProductsSelected),
            TInputListItem(inputListName: 'Shampoo', isSelected: controller.isShampooSelected),
            TInputListItem(inputListName: 'Body Soap', isSelected: controller.isBodySoapSelected),
            TInputListItem(inputListName: 'Hot Water', isSelected: controller.isHotWaterSelected),
            TInputListItem(inputListName: 'Shower gel', isSelected: controller.isShowerGelSelected),
          ],
          seeAllLabel: '',
        ),
      ],
    );
  }
}
