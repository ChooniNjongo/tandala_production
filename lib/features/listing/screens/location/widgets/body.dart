import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../utils/constants/color_system.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/typography.dart';

class LocationBody extends StatelessWidget {
  const LocationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          const FormNavigation(
            showLeftIcon: true,
            svgImageString: TImages.home,
            step3Text: 'Step 8: Location',
            initialValue: 0.1,
            targetValue: 1,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections * 2,
          ),
          const QuestionContainer(
            question: 'Let’s finish up!',
            body:
                'Use mobile app to complete this step. Go to your property location and capture gps coordinates.',
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections * 2,
          ),
          SvgPicture.asset('assets/images/hero_svg/location.svg'),
          const SizedBox(
            height: TSizes.spaceBtwSections * 2,
          ),
          
          Text("Are you at your property  location now?",style: TTypography.h4.copyWith(color: TColorSystem.n200,),textAlign: TextAlign.start,),
          const SizedBox(height: TSizes.spaceBtwItems,),
          const Text("Go there now. Press button below to capture location. Please all location tandalla to access your location from your device settings",style: TTypography.body14Regular,textAlign: TextAlign.start,),
          const SizedBox(height: TSizes.spaceBtwSections * 2,),

        ],
      ),
    );
  }
}
