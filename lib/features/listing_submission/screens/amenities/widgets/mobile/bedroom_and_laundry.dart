import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/section_input_list/section_input_list.dart';
import '../../../../../../common/widgets/section_input_list/widgets/input_list_item.dart';
import '../../../../controllers/amenities_step_controller.dart';

class BedroomAndLaundrySection extends StatelessWidget {
  const BedroomAndLaundrySection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AmenitiesStepController());
    return Column(
      children: [
        TSectionInputList(
          title: 'Bedroom And Laundry',
          listOfListInputItems: [
            TInputListItem(
              inputListName: 'Free washer',
              isSelected: controller.isFreeWasherSelected,
            ),
            TInputListItem(
              inputListName: 'Free dryer',
              isSelected: controller.isFreeDryerSelected,
            ),
            TInputListItem(
              inputListName: 'Towels',
              isSelected: controller.isTowelsSelected,
            ),
            TInputListItem(
              inputListName: 'Bed sheets',
              isSelected: controller.isBedSheetsSelected,
            ),
            TInputListItem(
              inputListName: 'Soap',
              isSelected: controller.isSoapSelected,
            ),
            TInputListItem(
              inputListName: 'Toilet paper',
              isSelected: controller.isToiletPaperSelected,
            ),
            TInputListItem(
              inputListName: 'Hangers',
              isSelected: controller.isHangersSelected,
            ),
            TInputListItem(
              inputListName: 'Bed linens',
              isSelected: controller.isBedLinensSelected,
            ),
            TInputListItem(
              inputListName: 'Extra pillows and blankets',
              isSelected: controller.isExtraPillowsAndBlanketsSelected,
            ),
            TInputListItem(
              inputListName: 'Room darkening- shades',
              isSelected: controller.isRoomDarkeningShadesSelected,
            ),
            TInputListItem(
              inputListName: 'Iron',
              isSelected: controller.isIronSelected,
            ),
            TInputListItem(
              inputListName: 'Closet',
              isSelected: controller.isClosetSelected,
            ),
          ],
          seeAllLabel: '',
        ),
      ],
    );
  }
}
