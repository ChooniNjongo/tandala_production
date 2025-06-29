import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/section_input_list/section_input_list.dart';
import '../../../../../../common/widgets/section_input_list/widgets/input_list_item.dart';
import '../../../../controllers/amenities_step_controller.dart';

class EntertainmentSection extends StatelessWidget {
  const EntertainmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AmenitiesStepController());
    return Column(
      children: [
        TSectionInputList(
          title: 'Entertainment',
          listOfListInputItems: [
            TInputListItem(
              inputListName: 'Ethernet connection',
              isSelected: controller.isEthernetConnectionSelected,
            ),
            TInputListItem(
              inputListName: 'Netflix',
              isSelected: controller.isNetflixSelected,
            ),
            TInputListItem(
              inputListName: 'DStv',
              isSelected: controller.isDStvSelected,
            ),
            TInputListItem(
              inputListName: 'Youtube',
              isSelected: controller.isYoutubeSelected,
            ),
            TInputListItem(
              inputListName: 'Prime TV',
              isSelected: controller.isPrimeTVSelected,
            ),
            TInputListItem(
              inputListName: 'Hulu',
              isSelected: controller.isHuluSelected,
            ),
            TInputListItem(
              inputListName: 'Books and reading material',
              isSelected: controller.isBooksAndReadingMaterialSelected,
            ),
          ],
          seeAllLabel: '',
        ),
      ],
    );
  }
}
