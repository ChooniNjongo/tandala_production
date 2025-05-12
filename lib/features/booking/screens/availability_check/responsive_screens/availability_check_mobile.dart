import 'package:cwt_ecommerce_admin_panel/common/widgets/booking_stage/booking_stage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../../common/pages/action.dart';
import '../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../models/booking/booking.dart';
import '../../../models/booking/booking_stages.dart';
import '../widgets/mobile/body.dart';
import '../widgets/mobile/owner_buttons.dart';
import '../widgets/mobile/user_buttons.dart';

class AvailabilityCheckScreenMobile extends StatelessWidget {
  final Booking booking;

  const AvailabilityCheckScreenMobile({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final uid = AuthenticationRepository.instance.authUser!.uid;
    final currentStage = booking.bookingStage;
    return ActionPage(
      overlayHeader: SizedBox(
        height: 96,
        child: BookingStageIndicator(
          isAvailabilityStage: currentStage == BookingStage.Availability,
          isPaymentStage: currentStage == BookingStage.Payment,
          isCheckInStage: currentStage == BookingStage.CheckIn,
          isReviewStage: currentStage == BookingStage.Review,),
      ),
      body: AvailabilityCheckBody(booking: booking),
      buttonContainer: uid == booking.listing.userId
          ? OwnerButtons(booking: booking)
          : UserButtons(booking: booking),
    );
  }
}
