import 'package:flutter/material.dart';
import '../../../../../common/pages/action.dart';
import '../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../models/booking/booking.dart';
import '../widgets/mobile/body.dart';
import '../widgets/mobile/check_in_owner_buttons.dart';
import '../widgets/mobile/check_in_user_buttons.dart';

class CheckInMobileScreen extends StatelessWidget {
  final Booking booking;
  const CheckInMobileScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final uid = AuthenticationRepository.instance.authUser!.uid;

    return ActionPage(
      body: CheckInBody(booking: booking),
      buttonContainer:
          uid == booking.listing.userId
              ? CheckInOwnerButtons(booking: booking)
              : CheckInUserButtons(booking: booking),
    );
  }
}
