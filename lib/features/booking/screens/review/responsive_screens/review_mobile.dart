import 'package:flutter/material.dart';
import '../../../../../common/pages/action.dart';
import '../../../../../common/widgets/booking_stage/booking_stage.dart';
import '../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../models/booking/booking.dart';
import '../widgets/mobile/body.dart';
import '../widgets/mobile/owner_review_buttons.dart';
import '../widgets/mobile/user_review_buttons.dart';

class ReviewMobileScreen extends StatelessWidget {
  final Booking booking;
  const ReviewMobileScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final uid = AuthenticationRepository.instance.authUser!.uid;
    final currentStage = booking.bookingStage;
    return ActionPage(
      overlayHeader: BookingStageIndicator(
        isAvailabilityStage: currentStage == BookingStage.Availability,
        isPaymentStage: currentStage == BookingStage.Payment,
        isCheckInStage: currentStage == BookingStage.CheckIn,
        isReviewStage: currentStage == BookingStage.Review,),
      body: ReviewBody(
        booking: booking,
      ),
      buttonContainer: uid == booking.listing.userId
          ? OwnerReviewButtons(booking: booking)
          : UserReviewButtons(booking: booking),
    );
  }
}
