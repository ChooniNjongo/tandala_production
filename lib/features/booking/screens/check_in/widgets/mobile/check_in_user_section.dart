import 'package:flutter/material.dart';

import '../../../../../../common/widgets/booking_stage/booking_stage.dart';
import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../models/booking/booking.dart';
import '../../../availability_check/widgets/mobile/booked_unit_images.dart';

class CheckInUserSection extends StatelessWidget {
  final Booking booking;

  const CheckInUserSection({super.key, required this.booking});

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
          /// Image Container
          BookedUnitImages(booking: booking),
          const SizedBox(height: TSizes.spaceBtwSections),
          const QuestionContainer(
            question: TTexts.checkInInstruction1,
            body: TTexts.checkInInstruction2,
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
