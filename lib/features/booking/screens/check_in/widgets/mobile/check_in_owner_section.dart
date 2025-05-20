import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../../common/widgets/booking_stage/booking_stage.dart';
import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/booking/booking.dart';
import '../../../availability_check/widgets/mobile/booked_unit_images.dart';

class CheckInOwnerSection extends StatelessWidget {
  final Booking booking;

  const CheckInOwnerSection({super.key, required this.booking});

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
          const SizedBox(height: TSizes.spaceBtwSections),

          /// Image Container
          BookedUnitImages(booking: booking),
          const SizedBox(height: TSizes.spaceBtwSections),
          const QuestionContainer(
            question: "Ask user to check in once on site",
            body:
                "Funds will be credited to your account once the user checks in.",
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          Center(
            child: LoadingAnimationWidget.progressiveDots(
                color: TColorSystem.primary300, size: 64),
          ),
        ],
      ),
    );
  }
}
