import 'package:flutter/material.dart';
import '../../../../../common/pages/action.dart';
import '../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../models/booking/booking.dart';
import '../widgets/mobile/body.dart';
import '../widgets/mobile/payment_owner_buttons.dart';
import '../widgets/mobile/payment_user_buttons.dart';

class PaymentMobileScreen extends StatelessWidget {
  final Booking booking;
  const PaymentMobileScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final uid = AuthenticationRepository.instance.authUser!.uid;

    return ActionPage(
      body:  PaymentBody(booking: booking,),
      buttonContainer:
          uid == booking.listing.userId
              ? PaymentOwnerButtons(booking: booking)
              : PaymentUserButtons(booking: booking),
    );
  }
}
