import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/section_input_list/section_input_list.dart';
import '../../../../../../common/widgets/section_input_list/widgets/input_list_item.dart';
import '../../../../controllers/amenities_step_controller.dart';

class LocationFeaturesSection extends StatelessWidget {
  const LocationFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AmenitiesStepController());
    return Column(
      children: [
        TSectionInputList(
          title: 'Location Features',
          listOfListInputItems: [
            TInputListItem(
              inputListName: 'Shopping mall nearby',
              isSelected: controller.isShoppingMallNearbySelected,
            ),
            TInputListItem(
              inputListName: 'Tourist attraction nearby',
              isSelected: controller.isTouristAttractionNearbySelected,
            ),
            TInputListItem(
              inputListName: 'University nearby attraction nearby',
              isSelected: controller.isUniversityNearbyAttractionNearbySelected,
            ),
            TInputListItem(
              inputListName: 'Hospital nearby attraction nearby',
              isSelected: controller.isHospitalNearbyAttractionNearbySelected,
            ),
          ],
          seeAllLabel: '',
        ),
      ],
    );
  }
}
