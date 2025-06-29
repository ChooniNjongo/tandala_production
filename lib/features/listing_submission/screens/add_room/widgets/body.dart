import 'package:flutter/material.dart';

import '../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class AddRoomBody extends StatelessWidget {
  const AddRoomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(TSizes.defaultSpaceDesktop),
      child: Column(
        children: [
          FormNavigation(
            showLeftIcon: true,
            svgImageString: TImages.home,
            step3Text: 'Step 8: Add Room',
            initialValue: 0.1,
            targetValue: 0.5,
          ),
          QuestionContainer(
            question:
                'In this part you get to add rooms available for visitors.',
            body:
                'Do not list all room but rather booking options available for guests. For example lets say you have 10 presidential rooms, just list one to represent that type.',
          ),
          SizedBox(
            height: TSizes.spaceBtwSections * 2,
          ),



          SizedBox(
            height: TSizes.spaceBtwSections * 2,
          ),
        ],
      ),
    );
  }
}
