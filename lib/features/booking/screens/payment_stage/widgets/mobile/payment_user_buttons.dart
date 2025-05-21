import 'package:flutter/material.dart';
import '../../../../controllers/booking_controller.dart';
import '../../../../models/booking/booking.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';

class PaymentUserBottomNavigationButtons extends StatelessWidget {
  final Booking booking;

  const PaymentUserBottomNavigationButtons({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    final controller = BookingController.instance;
    return TRoundedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Discard button
          OutlinedButton(
            child: const Text('Cancel'),
            onPressed: () {
              controller.cancelBooking(booking.bookingId);
            },
          ),

          // Save Changes button
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                controller.payForBooking(booking);
              },
              child: const Text('Pay Now'),
            ),
          ),
        ],
      ),
    );
  }
}
