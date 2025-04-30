import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/sizes.dart';

class UserPaymentSection extends StatelessWidget {
  const UserPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          const SizedBox(height: TSizes.spaceBtwSections * 3),
          const QuestionContainer(
            question: "Great news!! This unit is available.",
            body:
                "Go ahead and secure it now. We keep your money safe until check in.",
          ),
          const SizedBox(height: TSizes.spaceBtwSections * 3),
          Center(
            child: LoadingAnimationWidget.progressiveDots(
              size: 50, color: TColorSystem.primary300,
            ),
          ),
        ],
      ),
    );
  }
}
