import 'package:flutter/material.dart';

import '../../../../../common/pages/action.dart';
import '../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
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
    return ActionPage(
      overlayHeader: SizedBox(height: 8,),
      body: BookingCompletedBody(booking: booking),
      buttonContainer:
      uid == booking.listing.userId
          ? const SizedBox()
          : BookingCompletedUserButtons(booking: booking),
    );
  }
}



