import 'package:cwt_ecommerce_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import '../../../../../common/pages/action.dart';
import '../../../models/booking/booking.dart';
import '../widgets/mobile/cancelled_booking_body.dart';
import '../widgets/mobile/cancelled_booking_owner_buttons.dart';
import '../widgets/mobile/cancelled_booking_user_buttons.dart';

class CancelledBookingMobileScreen extends StatelessWidget {
  final Booking booking;

  const CancelledBookingMobileScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final uid = AuthenticationRepository.instance.authUser!.uid;
    return ActionPage(
      body: CancelledBookingBody(booking: booking),
      buttonContainer:
          uid == booking.listing.userId
              ? CancelledBookingOwnerButtons(booking: booking)
              : CancelledBookingUserButtons(booking: booking),
    );
  }
}
