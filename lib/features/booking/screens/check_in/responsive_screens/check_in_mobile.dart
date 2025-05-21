import 'package:flutter/material.dart';
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

    return Scaffold(
      body: CheckInBody(booking: booking),
      bottomNavigationBar:
          uid == booking.listing.userId
              ? CheckInOwnerBottomNavigationButtons(booking: booking)
              : CheckInUserBottomNavigationButtons(booking: booking),
    );
  }
}
