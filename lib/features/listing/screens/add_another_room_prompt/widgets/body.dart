import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/buttons/extensible_hug_content_outline_button.dart';
import '../../../../../common/widgets/cards/list_item_card/list_item.dart';
import '../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../routes/routes.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class AddAnotherRoomPromptBody extends StatelessWidget {
  const AddAnotherRoomPromptBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpaceDesktop),
      child: Column(
        children: [

          const FormNavigation(
            showLeftIcon: true,
            svgImageString: TImages.home,
            step3Text: 'Step 8: Add More Rooms Prompt',
            initialValue: 0.1,
            targetValue: 0.5,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections * 2,
          ),
          const QuestionContainer(
            question:
                'In this part you get to add rooms available for visitors.',
            body:
                'Do not list all room but rather booking options available for guests. Y ou can represent same room types with pictures from one room.',
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections * 2,
          ),
          // SvgPicture.asset('assets/images/hero_svg/room.svg'),

          const TListItemCard(
              productName: 'Presidential Suite',
              productInfo: '2 beds',
              productsSubInfo: 'Hot',
              price: 'K3000',
              actionIcon: TImages.moreVertical),
          const SizedBox(
            height: TSizes.spaceBtwSections * 2,
          ),
          ExtensibleHugContentOutlineButton(
            buttonLabel: 'Add Another Room',
            onPressed: () {
              Get.toNamed(TRoutes.addRoomDetails);
            },
          )
        ],
      ),
    );
  }
}
