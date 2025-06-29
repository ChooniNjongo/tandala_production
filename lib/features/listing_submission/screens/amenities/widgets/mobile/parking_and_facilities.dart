import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/section_input_list/section_input_list.dart';
import '../../../../../../common/widgets/section_input_list/widgets/input_list_item.dart';
import '../../../../controllers/amenities_step_controller.dart';

class ParkingAndFacilitiesSection extends StatelessWidget {
  const ParkingAndFacilitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AmenitiesStepController());
    return Column(
      children: [
        TSectionInputList(
          title: 'Parking And Facilities',
          listOfListInputItems: [
            TInputListItem(
              inputListName: 'Free parking on premises',
              isSelected: controller.isFreeParkingOnPremisesSelected,
            ),
            TInputListItem(
              inputListName: 'Free street parking',
              isSelected: controller.isFreeStreetParkingSelected,
            ),
            TInputListItem(
              inputListName: 'Private outdoor pool',
              isSelected: controller.isPrivateOutdoorPoolSelected,
            ),
          ],
          seeAllLabel: '',
        ),
      ],
    );
  }
}
