import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/buttons/extensible_hug_content_outline_button.dart';
import '../../../../../common/widgets/dividers/extensible_full_width_divider.dart';
import '../../../../../common/widgets/input_fields/input_field.dart';
import '../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../common/widgets/section_input_list/section_input_list.dart';
import '../../../../../common/widgets/section_input_list/widgets/input_list_item.dart';
import '../../../../../utils/constants/color_system.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/typography.dart';

class AddRoomDetailsBody extends StatelessWidget {
  const AddRoomDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          const FormNavigation(
            showLeftIcon: true,
            svgImageString: TImages.home,
            step3Text: 'Step 8: Add Room',
            initialValue: 0.1,
            targetValue: 0.5,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections * 2,
          ),
          const QuestionContainer(
            question: 'Provide all the room details below',
            body:
                'Have the pictures for the room available to comeplete this step.',
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections * 2,
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Whats the name of your room?",
                style: TTypography.h5.copyWith(color: TColorSystem.n100),
              )),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          const InputField(
              placeHolder: 'Your Room Name e.g Presidential Suite'),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Short room description",
                style: TTypography.h5.copyWith(color: TColorSystem.n100),
              )),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          const InputField(
              placeHolder: 'In a few words describe this room'),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Price per night?",
                style: TTypography.h5.copyWith(color: TColorSystem.n100),
              )),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          const InputField(
              placeHolder: 'K2000'),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          /// Room services
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          TSectionInputList(
              title: 'Amenities',
              listOfListInputItems: [
                TInputListItem(
                  inputListName: 'Wifi',
                  isSelected: true.obs,
                ),
                TInputListItem(
                  inputListName: 'Parking',
                  isSelected: false.obs,
                ),
                TInputListItem(
                  inputListName: 'Air conditioning',
                  isSelected: false.obs,
                ),
                TInputListItem(
                  inputListName: 'Heating',
                  isSelected: true.obs,
                ),
                TInputListItem(
                  inputListName: 'Breakfast',
                  isSelected: true.obs,
                ),
              ],
              seeAllLabel: 'See all 24 options'),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          const ExtensibleFullWidthDivider(),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          TSectionInputList(
              title: 'Services',
              listOfListInputItems: [
                TInputListItem(
                  inputListName: 'Laundry',
                  isSelected: true.obs,
                ),
                TInputListItem(
                  inputListName: 'House keeping',
                  isSelected: false.obs,
                ),
                TInputListItem(
                  inputListName: 'Breakfast',
                  isSelected: true.obs,
                ),
              ],
              seeAllLabel: 'See all 24 options'),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          const ExtensibleFullWidthDivider(),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Text(
            "Now its time to add pictures of the room",
            style: TTypography.h4.copyWith(color: TColorSystem.n100),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Text(
            'Please add the most accurate pictures of this room  making sure to show bed and bathroom areas',
            style: TTypography.body14Regular.copyWith(color: TColorSystem.n400),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          ExtensibleHugContentOutlineButton(buttonLabel: 'Upload Photos', onPressed: () {  },),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
        ],
      ),
    );
  }
}
