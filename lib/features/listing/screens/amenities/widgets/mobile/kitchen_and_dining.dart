import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/section_input_list/section_input_list.dart';
import '../../../../../../common/widgets/section_input_list/widgets/input_list_item.dart';
import '../../../../controllers/amenities_step_controller.dart';

class KitchenAndDiningSection extends StatelessWidget {
  const KitchenAndDiningSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AmenitiesStepController());
    return Column(
      children: [
        TSectionInputList(
          title: 'Kitchen And Dining',
          listOfListInputItems: [
            TInputListItem(
              inputListName: 'Kitchen',
              isSelected: controller.isKitchenSelected,
            ),
            TInputListItem(inputListName: 'Refrigerator', isSelected: controller.isRefrigeratorSelected),
            TInputListItem(inputListName: 'Microwave', isSelected: controller.isMicrowaveSelected),
            TInputListItem(inputListName: 'Cooking basics eg pots ,pans salt pepper etc', isSelected: controller.isCookingBasicsSelected),
            TInputListItem(inputListName: 'Dishes and silverware', isSelected: controller.isDishesAndSilverwareSelected),
            TInputListItem(inputListName: 'Freezer', isSelected: controller.isFreezerSelected),
            TInputListItem(inputListName: 'Dishwasher', isSelected: controller.isDishwasherSelected),
            TInputListItem(inputListName: 'Induction stove',isSelected: controller.isInductionStoveSelected),
            TInputListItem(inputListName: 'Oven', isSelected: controller.isOvenSelected),
            TInputListItem(inputListName: 'Hot water kettle', isSelected: controller.isHotWaterKettleSelected),
            TInputListItem(inputListName: 'Coffee maker', isSelected: controller.isCoffeeMakerSelected),
            TInputListItem(inputListName: 'Wine glasses', isSelected: controller.isWineGlassesSelected),
            TInputListItem(inputListName: 'Toaster', isSelected: controller.isToasterSelected),
            TInputListItem(inputListName: 'Barbeque utensils', isSelected: controller.isBarbequeUtensilsSelected),
            TInputListItem(inputListName: 'Dining table', isSelected: controller.isDiningTableSelected),
            TInputListItem(inputListName: 'Coffee', isSelected: controller.isCoffeeSelected),
          ],
          seeAllLabel: '',
        ),
      ],
    );
  }
}
