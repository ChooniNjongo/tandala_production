import 'package:flutter/material.dart';

import '../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../models/booking/booking.dart';
import '../widgets/mobile/booking_completed_body.dart';
import '../widgets/mobile/booking_completed_user_button.dart';

class BookingCompletedMobileScreen extends StatelessWidget {
  final Booking booking;
  const BookingCompletedMobileScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final uid = AuthenticationRepository.instance.authUser!.uid;
    return Scaffold(
      body: BookingCompletedBody(booking: booking),
      bottomNavigationBar:
      uid == booking.listing.userId
          ? const SizedBox()
          : BookingCompletedUserBottomNavigationButtons(booking: booking),
    );
  }
}



