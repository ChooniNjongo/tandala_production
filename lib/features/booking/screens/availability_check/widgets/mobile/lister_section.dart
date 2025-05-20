import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../../common/widgets/booking_stage/booking_stage.dart';
import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/booking/booking.dart';
import '../../../../models/property/room.dart';
import 'booked_unit_images.dart';

class ListerSection extends StatelessWidget {
  final Booking booking;
  const ListerSection({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final currentStage = booking.bookingStage;
    // Find the room that matches the roomId in the booking
    Room? room = booking.listing.rooms.firstWhereOrNull(
          (room) => room.roomId == booking.roomId,
    );
    return Column(
      children: [
        BookingStageIndicator(
          isAvailabilityStage: currentStage == BookingStage.Availability,
          isPaymentStage: currentStage == BookingStage.Payment,
          isCheckInStage: currentStage == BookingStage.CheckIn,
          isReviewStage: currentStage == BookingStage.Review,),
        const SizedBox(height: TSizes.spaceBtwSections),
        /// Image Container
        BookedUnitImages(booking: booking),
        const QuestionContainer(
          question: "Please confirm if this unit is available.",
          body:
          "A customer wants to book the above unit. Please either accept or reject the request to complete booking",
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        Center(
          child: LoadingAnimationWidget.twistingDots(
            leftDotColor: TColorSystem.primary500,
            rightDotColor: TColorSystem.n200,
            size: 50,
          ),
        ),
      ],
    );
  }
}