import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/sizes.dart';

class CheckInOwnerSection extends StatelessWidget {
  const CheckInOwnerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          const SizedBox(height: TSizes.spaceBtwSections * 2),
          const QuestionContainer(
            question: "Waiting for user to check in.",
            body:
                "Funds will be credited to your account once the user checks in.",
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          Center(
            child: LoadingAnimationWidget.progressiveDots(color: TColorSystem.primary300, size: 64

            ),
          ),
        ],
      ),
    );
  }
}
