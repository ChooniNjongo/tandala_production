import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../../common/widgets/booking_stage/booking_stage.dart';
import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/booking/booking.dart';
import 'booked_unit_images.dart';

class UserSection extends StatelessWidget {
  final Booking booking;

  const UserSection({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final currentStage = booking.bookingStage;
    return Column(
      children: [
        BookingStageIndicator(
          isAvailabilityStage: currentStage == BookingStage.Availability,
          isPaymentStage: currentStage == BookingStage.Payment,
          isCheckInStage: currentStage == BookingStage.CheckIn,
          isReviewStage: currentStage == BookingStage.Review,),
        const SizedBox(height: TSizes.spaceBtwSections),
        const QuestionContainer(
          question: "Wait for host to confirm availability",
          body:
              "This can take a few minutes or more depending on host, you are NOT going to pay until we confirm.",
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        const Center(
          child: SpinKitPouringHourGlass(
            color: TColorSystem.primary500,
            size: 50.0,
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        BookedUnitImages(booking: booking),
      ],
    );
  }
}
