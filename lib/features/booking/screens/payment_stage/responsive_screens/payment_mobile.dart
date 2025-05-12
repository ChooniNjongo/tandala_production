import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../common/pages/action.dart';
import '../../../../../common/widgets/booking_stage/booking_stage.dart';
import '../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../models/booking/booking.dart';
import '../../../models/booking/booking_stages.dart';
import '../widgets/mobile/body.dart';
import '../widgets/mobile/payment_owner_buttons.dart';
import '../widgets/mobile/payment_user_buttons.dart';

class PaymentMobileScreen extends StatelessWidget {
  final Booking booking;
  const PaymentMobileScreen({super.key, required this.booking});

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
      body:  PaymentBody(booking: booking,),
      buttonContainer:
          uid == booking.listing.userId
              ? PaymentOwnerButtons(booking: booking)
              : PaymentUserButtons(booking: booking),
    );
  }
}
