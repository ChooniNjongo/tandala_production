import 'package:flutter/material.dart';

import '../../../../../../common/widgets/booking_stage/booking_stage.dart';
import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/booking/booking.dart';
import '../../../availability_check/widgets/mobile/booked_unit_images.dart';

class UserPaymentSection extends StatelessWidget {
  final Booking booking;

  const UserPaymentSection({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final currentStage = booking.bookingStage;
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          BookingStageIndicator(
            isAvailabilityStage: currentStage == BookingStage.Availability,
            isPaymentStage: currentStage == BookingStage.Payment,
            isCheckInStage: currentStage == BookingStage.CheckIn,
            isReviewStage: currentStage == BookingStage.Review,),
          const QuestionContainer(
            question:  "🥳 Woohoo! Your booking request was accepted!",
            body:
                "We keep your money safe until check in.",
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          /// Image Container
          BookedUnitImages(booking: booking),
          const SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
