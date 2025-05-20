import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/booking_stage/booking_stage.dart';
import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/review_controller.dart';
import '../../../../models/booking/booking.dart';

class OwnerReviewSection extends StatelessWidget {
  final Booking booking;

  const OwnerReviewSection({super.key, required this.booking});

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
              question: 'Customer was prompted to review',
              body:
                  'Customers will rate how they found there stay at your place.',
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              height: 200,
              width: 200,
              child: SvgPicture.asset(
                TImages.ratingStory,
              ),
            )
          ],
        ),
      ),
    );
  }
}
