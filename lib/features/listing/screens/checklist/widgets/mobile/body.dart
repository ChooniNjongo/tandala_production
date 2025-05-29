import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../common/widgets/section_input_list/section_input_list.dart';
import '../../../../../../common/widgets/section_input_list/widgets/input_list_item.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/checklist_controller.dart';

class ChecklistBody extends StatelessWidget {
  const ChecklistBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChecklistController());
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          const FormNavigation(
            step3Text: 'Step 1 of 12: Checklist',
            initialValue: 0.00,
            targetValue: 0.1,
            actionText: "Finish Later",
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          const QuestionContainer(
            question: 'Let’s get started with having your property on Tandala.',
            body:
                'To complete your listing we have summarized everything you need.',
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections / 2,
          ),
          TSectionInputList(
            title: 'Listing requirements',
            listOfListInputItems: [
              TInputListItem(
                inputListName: 'Property details',
                isSelected: controller.isPropertyDetailsSelected,
              ),
              TInputListItem(
                inputListName: 'Pictures of your place',
                isSelected: controller.isPropertyPictureSelected,
              ),
              TInputListItem(
                inputListName: 'Access to location of property',
                isSelected: controller.isPropertyLocationSelected,
              ),
            ],
            seeAllLabel: 'Select the requirements you have available',
          )
        ],
      ),
    );
  }
}
