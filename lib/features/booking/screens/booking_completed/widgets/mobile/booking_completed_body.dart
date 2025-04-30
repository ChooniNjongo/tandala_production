import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../models/booking/booking.dart';
import '../../../availability_check/widgets/mobile/booked_unit_images.dart';

class BookingCompletedBody extends StatelessWidget {
  final Booking booking;
  const BookingCompletedBody({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Success Animation
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(
                TImages
                    .paymentSuccessfulAnimation, // Provide the correct Lottie file path
                width: 200,
                height: 200,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),

        const QuestionContainer(
          question: "Successfully completed the booking.",
          body: "We hope you enjoyed your stay here",
        ),
        /// Image Container
        BookedUnitImages(booking: booking),
      ],
    );
  }
}
