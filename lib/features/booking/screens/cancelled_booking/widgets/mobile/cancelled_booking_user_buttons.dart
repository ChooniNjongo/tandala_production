import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../routes/routes.dart';
import '../../../../controllers/booking_controller.dart';
import '../../../../models/booking/booking.dart';


import '../../../../../../common/widgets/containers/rounded_container.dart';

class CancelledBookingUserBottomNavigationButtons extends StatelessWidget {
  final Booking booking;

  const CancelledBookingUserBottomNavigationButtons({
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
            child: const Text('Report'),
            onPressed: () {
              controller.confirmAvailability(booking.bookingId, false);
            },
          ),

          // Save Changes button
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(
                  TRoutes.listingViewing,
                  arguments: {
                    'listing': booking.listing,
                    'isEditing': false, // Or true, depending on your use case
                  },
                );
              },
              child: const Text('Book Again '),
            ),
          ),
        ],
      ),
    );
  }
}
