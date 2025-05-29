import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/input_fields/input_field.dart';
import '../../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/description_controller.dart';

class DescriptionBody extends StatelessWidget {
  const DescriptionBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DescriptionStepController());
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          const FormNavigation(
            showLeftIcon: true,
            svgImageString: TImages.home,

            step3Text: 'Step 3: Property Description',
            initialValue: 0.09,
            targetValue: 0.1,
          ),
          const SizedBox(height: TSizes.spaceBtwSections * 2),
          const QuestionContainer(
            question: 'Tell Tandala users whats special about your place.',
            body:
                'You can take this time to tell users what makes your place stand out. Be creative and brief.',
          ),
          const SizedBox(height: TSizes.spaceBtwSections * 2),
          InputField(
            placeHolder: "Describe your place for visitors",
            controller: controller.propertyDescriptionTextEditingController,
            onEditingComplete: controller.onEditingComplete,
          ),
          const SizedBox(height: TSizes.spaceBtwSections * 2),
        ],
      ),
    );
  }
}
