import 'package:flutter/material.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../common/widgets/dialog/t_dialog.dart';
import '../../../../controllers/booking_controller.dart';
import '../../../../models/booking/booking.dart';

class AvailabilityUserBottomNavigationButtons extends StatelessWidget {
  final Booking booking;

  const AvailabilityUserBottomNavigationButtons({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    final controller = BookingController.instance;
    return TRoundedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Discard button
          OutlinedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TAlertDialog(
                    title: 'Cancel Booking',
                    message:
                    'If you no longer wish to proceed with this booking,you can cancel it. Costs maybe incurred.',
                    buttonLabel: 'Cancel',
                    onTapPrimaryAction:
                        () => controller.cancelBooking(booking.bookingId),
                  );
                },
              );
            },
            child: const Text('Cancel Booking'),
          ),


        ],
      ),
    );
  }
}

