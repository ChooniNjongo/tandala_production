import 'package:flutter/material.dart';
import '../../../../controllers/booking_controller.dart';
import '../../../../models/booking/booking.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';

class CancelledBookingOwnerBottomNavigationButtons extends StatelessWidget {
  final Booking booking;

  const CancelledBookingOwnerBottomNavigationButtons({
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
            onPressed: () {
              // Add functionality to discard changes if needed
            },
            child: const Text('Report'),
          ),


        ],
      ),
    );
  }
}




