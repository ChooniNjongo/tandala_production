import 'package:flutter/material.dart';
import '../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../models/booking/booking.dart';
import '../widgets/mobile/body.dart';
import '../widgets/mobile/owner_buttons.dart';
import '../widgets/mobile/user_buttons.dart';

class AvailabilityCheckScreenMobile extends StatelessWidget {
  final Booking booking;

  const AvailabilityCheckScreenMobile({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final uid = AuthenticationRepository.instance.authUser!.uid;

    return Scaffold(
      body: AvailabilityCheckBody(booking: booking),
      bottomNavigationBar: uid == booking.listing.userId
          ? AvailabilityOwnerBottomNavigationButtons(booking: booking)
          : AvailabilityUserBottomNavigationButtons(booking: booking),
    );
  }
}
