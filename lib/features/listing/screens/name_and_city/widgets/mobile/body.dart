import 'package:cwt_ecommerce_admin_panel/features/listing/screens/name_and_city/widgets/mobile/select_city.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/validators/validation.dart';
import '../../../../controllers/name_and_city_controller.dart';

class NameAndCityBody extends StatelessWidget {
  const NameAndCityBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NameAndCityStepController());

    return Form(
      key: controller.nameAndCityFormKey,
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpaceDesktop),
        child: Column(
          children: [
            const FormNavigation(
              step3Text: 'Step 3 of 12: Name and City',
              initialValue: 0.3,
              targetValue: 0.4,
            ),
            const SizedBox(height: TSizes.spaceBtwSections / 2),
            const QuestionContainer(
              question: 'Provide property name',
              body: 'This is the name that will appear on the Tandala and also in search results',
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Property Name Input Field
            SizedBox(
              width: 320,
              child: TextFormField(
                controller: controller.propertyNameTextEditingController,
                validator: (value) => TValidator.validateEmptyText('Your Property Name', value),
                decoration: const InputDecoration(
                  labelText: 'Your Property Name',
                ),
                onEditingComplete: () => controller.onEditingComplete(),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwSections),
            const QuestionContainer(
              question: 'Where is your property situated?',
              body: 'Select your city from the list below',
            ),
            const CitySelection(),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}