import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/sizes.dart';

class ListerPaymentSection extends StatelessWidget {
  const ListerPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          const SizedBox(height: TSizes.spaceBtwSections * 3),
          const QuestionContainer(
            question: "Waiting for payment.",
            body: "Please wait for user to make payment.",
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          Center(
            child: LoadingAnimationWidget.progressiveDots(
              size: 50,
              color: TColorSystem.primary300,
            ),
          ),
        ],
      ),
    );
  }
}
