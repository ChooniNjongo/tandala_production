import 'package:cwt_ecommerce_admin_panel/features/listing/screens/name_and_city/widgets/mobile/select_city.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/input_fields/input_field.dart';
import '../../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/name_and_city_controller.dart';

class NameAndCityBody extends StatelessWidget {
  const NameAndCityBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NameAndCityStepController());
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          const FormNavigation(
            step3Text: 'Step 3 of 12:  Name and City',
            initialValue: 0.3,
            targetValue: 0.4,
          ),
          const SizedBox(height: TSizes.spaceBtwSections * 2),
          const QuestionContainer(
            question: 'What city or town are you located in?',
            body: 'Select your city from the list below',
          ),
          const CitySelection(),
          const SizedBox(height: TSizes.spaceBtwSections * 2),
          const QuestionContainer(
            question: 'What is the name of your place?',
            body:
                'This is the name that will appear on the Tandala and also in search results',
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          InputField(
            placeHolder: "Your Hotel Name",
            controller: controller.propertyNameTextEditingController,
            onEditingComplete: controller.onEditingComplete,
          ),
        ],
      ),
    );
  }
}
