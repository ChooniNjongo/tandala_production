import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../common/pages/action.dart';
import '../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../models/booking/booking.dart';
import '../widgets/mobile/booking_completed_body.dart';
import '../widgets/mobile/booking_completed_user_button.dart';

class BookingCompletedMobileScreen extends StatelessWidget {
  final Booking booking;
  const BookingCompletedMobileScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    final uid = storage.read("uid") as String;
    return ActionPage(
      overlayHeader: const FormNavigation(
        showLeftIcon: true,
        step3Text: 'Booking completed',
        initialValue: 1.0,
        targetValue: 1.0,
      ),
      body: BookingCompletedBody(booking: booking),
      buttonContainer:
      uid == booking.listing.userId
          ? SizedBox()
          : BookingCompletedUserButtons(booking: booking),
    );
  }
}



