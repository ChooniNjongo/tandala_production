import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/cards/ratings/rating_indicator.dart';
import '../../../../../../common/widgets/input_fields/input_field.dart';
import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../common/widgets/selection/circular_count_select.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/review_controller.dart';

class UserReviewSection extends StatelessWidget {
  const UserReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewController());
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Obx(
        () => Column(
          children: [
            const SizedBox(height: TSizes.spaceBtwSections * 2),
            const QuestionContainer(
              question: 'How was your stay ?',
              body:
                  'Your feed is important to us. It helps us curated our recommendations based on your experience.',
            ),
            const SizedBox(height: TSizes.spaceBtwSections * 2),
            TRatingBarIndicator(rating: controller.rating.value),
            const SizedBox(height: TSizes.spaceBtwSections),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularCountSelect(
                  count: '1',
                  isSelected: controller.isRatingOneSelected.value,
                  onTap: controller.onRatingOneTapped,
                ),
                CircularCountSelect(
                  count: '2',
                  isSelected: controller.isRatingTwoSelected.value,
                  onTap: controller.onRatingTwoTapped,
                ),
                CircularCountSelect(
                  count: '3',
                  isSelected: controller.isRatingThreeSelected.value,
                  onTap: controller.onRatingThreeTapped,
                ),
                CircularCountSelect(
                  count: '4',
                  isSelected: controller.isRatingFourSelected.value,
                  onTap: controller.onRatingFourTapped,
                ),
                CircularCountSelect(
                  count: '5',
                  isSelected: controller.isRatingFiveSelected.value,
                  onTap: controller.onRatingFiveTapped,
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            InputField(
              placeHolder: "Tell us how you found this place?",
              controller: controller.reviewTextEditingController,
            ),
          ],
        ),
      ),
    );
  }
}
