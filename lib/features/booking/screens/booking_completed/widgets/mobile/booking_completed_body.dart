import 'package:cwt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../common/widgets/booking_stage/booking_stage.dart';
import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../models/booking/booking.dart';
import '../../../availability_check/widgets/mobile/booked_unit_images.dart';

class BookingCompletedBody extends StatelessWidget {
  final Booking booking;
  const BookingCompletedBody({super.key, required this.booking});

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

        const QuestionContainer(
          question: "Thank you for using tandala",
          body: "We hope you enjoyed your stay here",
        ),

        const SizedBox(height: TSizes.spaceBtwItems,),
        /// Image Container
        BookedUnitImages(booking: booking),
        /// Success Animation
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(
                TImages
                    .paymentSuccessfulAnimation, // Provide the correct Lottie file path
                width: 220,
                height: 220,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
