import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/chips/full_width_chip_label.dart';
import '../../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/property_type_step_controller.dart';

class PropertyTypeBody extends StatelessWidget {
  const PropertyTypeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PropertyTypeStepController());
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Obx(
        () => Column(
          children: [
            const FormNavigation(
              step3Text: 'Step 2 of 12:  Property type',
              initialValue: 0.1,
              targetValue: 0.2,
            ),
            const SizedBox(height: TSizes.spaceBtwSections * 2),
            const QuestionContainer(
              question: 'What type of property are you listing ?',
              body:
                  'This will help users when searching. Choose from options below',
            ),
            const SizedBox(height: TSizes.spaceBtwSections * 2),
            FullWidthChipLabel(
              label: 'Lodge or Guest House',
              isSelected: controller.isLodgeOrGuestHouseSelected.value,
              onTap: controller.onLodgeOrGuestHouseSelected,
            ),
            FullWidthChipLabel(
              label: 'Hotel',
              isSelected: controller.isHotelSelected.value,
              onTap: controller.onHotelSelected,
            ),
            FullWidthChipLabel(
              label: 'Apartment',
              isSelected: controller.isApartmentSelected.value,
              onTap: controller.onApartmentSelected,
            ),
            FullWidthChipLabel(
              label: 'Other',
              isSelected: controller.isOtherSelected.value,
              onTap: controller.onOtherSelected,
            ),
          ],
        ),
      ),
    );
  }
}
