import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../../common/widgets/booking_stage/booking_stage.dart';
import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/booking/booking.dart';
import '../../../availability_check/widgets/mobile/booked_unit_images.dart';

class ListerPaymentSection extends StatelessWidget {
  final Booking booking;

  const ListerPaymentSection({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final currentStage = booking.bookingStage;
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpaceDesktop),
      child: Column(
        children: [
          BookingStageIndicator(
            isAvailabilityStage: currentStage == BookingStage.Availability,
            isPaymentStage: currentStage == BookingStage.Payment,
            isCheckInStage: currentStage == BookingStage.CheckIn,
            isReviewStage: currentStage == BookingStage.Review,),
          const QuestionContainer(
            question: "Waiting for payment",
            body: "Please wait for user to make payment.",
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          const Center(
            child: SpinKitPouringHourGlass(
              color: TColorSystem.primary500,
              size: 49.0,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          /// Image Container
          BookedUnitImages(booking: booking),
        ],
      ),
    );
  }
}
