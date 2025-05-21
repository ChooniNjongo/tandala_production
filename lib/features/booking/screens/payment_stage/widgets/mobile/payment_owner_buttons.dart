import 'package:flutter/material.dart';
import '../../../../controllers/booking_controller.dart';
import '../../../../models/booking/booking.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';

class PaymentOwnerBottomNavigationButtons extends StatelessWidget {
  final Booking booking;

  const PaymentOwnerBottomNavigationButtons({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    final controller = BookingController.instance;
    return TRoundedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Discard button
          OutlinedButton(
            child: const Text('Cancel'),
            onPressed: () {
              controller.cancelBooking(booking.bookingId);
            },
          ),
        ],
      ),
    );
  }
}
