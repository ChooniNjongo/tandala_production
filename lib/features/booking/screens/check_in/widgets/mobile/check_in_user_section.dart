import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';

class CheckInUserSection extends StatelessWidget {
  const CheckInUserSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          const SizedBox(height: TSizes.spaceBtwSections * 2),
          const QuestionContainer(
            question: "Once at the site, click button below to check in.",
            body:
                "Go ahead and check in. Use map below for directions on how to get to host location.",
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          Text(
            "Google maps",
            style: TTypography.body10Regular.copyWith(
              color: TColors.primary100,
            ),
          ),
          SvgPicture.asset("assets/images/map/logos_google-maps.svg"),
          const SizedBox(height: TSizes.spaceBtwSections),
          SvgPicture.asset("assets/images/hero_svg/check_in.svg"),
        ],
      ),
    );
  }
}
