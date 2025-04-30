import 'package:flutter/material.dart';

import '../../../utils/constants/color_system.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/typography.dart';


class QuestionContainer extends StatelessWidget {
  final String? question;
  final String? body;
  final bool large;

  const QuestionContainer({
    super.key,
    this.question,
    this.body,  this.large = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (question != null) // Check if question is not null
          Text(
            question!,
            textAlign: TextAlign.center,
            style: large? TTypography.h2.copyWith(
              color: TColorSystem.n100,
            ):TTypography.h3.copyWith(
              color: TColorSystem.n100,
            ),
          ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        /// If large add space
        if (large) const SizedBox(height: TSizes.spaceBtwItems,),
        if (body != null) // Check if body is not null
          Text(
            body!,
            textAlign: TextAlign.center,
            style:large? TTypography.body16Regular.copyWith(color: TColorSystem.n400):TTypography.body14Regular.copyWith(color: TColorSystem.n400),
          ),


      ],
    );
  }
}
