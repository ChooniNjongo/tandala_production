import 'package:flutter/material.dart';
import '../../../../controllers/booking_controller.dart';
import '../../../../models/booking/booking.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';

class AvailabilityOwnerBottomNavigationButtons extends StatelessWidget {
  final Booking booking;

  const AvailabilityOwnerBottomNavigationButtons({
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
            onPressed: () {
              // Add functionality to discard changes if needed
            },
            child: const Text('Reject'),
          ),

          // Save Changes button
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                controller.confirmAvailability(booking.bookingId, true);
              },
              child: const Text('Accept '),
            ),
          ),
        ],
      ),
    );
  }
}
