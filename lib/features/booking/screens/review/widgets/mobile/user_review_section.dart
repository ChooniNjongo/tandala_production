import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/booking_stage/booking_stage.dart';
import '../../../../../../common/widgets/cards/ratings/rating_indicator.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../common/widgets/selection/circular_count_select.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/validators/validation.dart';
import '../../../../controllers/review_controller.dart';
import '../../../../models/booking/booking.dart';

class UserReviewSection extends StatelessWidget {
  final Booking booking;

  const UserReviewSection({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewController());
    final currentStage = booking.bookingStage;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Obx(
        () => Column(
          children: [
            BookingStageIndicator(
              isAvailabilityStage: currentStage == BookingStage.Availability,
              isPaymentStage: currentStage == BookingStage.Payment,
              isCheckInStage: currentStage == BookingStage.CheckIn,
              isReviewStage: currentStage == BookingStage.Review,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            const QuestionContainer(
              question: 'How was your stay ?',
              body:
                  'Your feed is important to us. It helps us curated our recommendations based on your experience.',
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            TRoundedContainer(
              child: Form(
                key: controller.titleDescriptionFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Description Input Field
                    SizedBox(
                      height: 160,
                      child: TextFormField(
                        expands: true,
                        maxLines: null,
                        textAlign: TextAlign.start,
                        controller: controller.description,
                        keyboardType: TextInputType.multiline,
                        textAlignVertical: TextAlignVertical.top,
                        validator: (value) =>
                            TValidator.validateEmptyText('Your Review', value),
                        decoration: const InputDecoration(
                          labelText: 'How was your stay?',
                          hintText: 'Add your Review here...',
                          alignLabelWithHint: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections / 2),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: QuestionContainer(
                question: '',
                body:
                    'On a scale of 1 to 5, how would you rate your experience?',
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: 290,
              child: Row(
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
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            TRatingBarIndicator(rating: controller.rating.value),
          ],
        ),
      ),
    );
  }
}
