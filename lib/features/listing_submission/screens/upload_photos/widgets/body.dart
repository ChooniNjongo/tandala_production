import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class UploadPhotosBody extends StatelessWidget {
  const UploadPhotosBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpaceDesktop),
      child: Column(
        children: [
          const FormNavigation(
            showLeftIcon: true,
            svgImageString: TImages.home,
            step3Text: 'Step 5: Add Photos',
            initialValue: 0.1,
            targetValue: 0.5,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections * 2,
          ),
          const QuestionContainer(
            question: 'Upload photos of your place',
            body:
                'Add nice photos that will appear as the main display in search results . This must show outside views of your place with main entrance.',
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections * 2,
          ),
          SvgPicture.asset('assets/images/hero_svg/image_upload.svg'),
        ],
      ),
    );
  }
}
