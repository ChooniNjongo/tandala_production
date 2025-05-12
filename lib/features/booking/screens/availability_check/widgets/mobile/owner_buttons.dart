import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/button_container/button_container.dart';
import '../../../../../../common/widgets/buttons/t_text_button.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/booking_controller.dart';
import '../../../../models/booking/booking.dart';

class OwnerButtons extends StatelessWidget {
  final Booking booking;

  const OwnerButtons({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final controller = BookingController.instance;
    return ButtonContainer(
      button1: TTextButton(
        label: 'Reject',
        labelColor: Colors.red,
        onPressed: () {
          controller.confirmAvailability(booking.bookingId, false);
        },
      ),
      button2: SizedBox(
        width: TSizes.buttonWidth,
        child: ElevatedButton(
          onPressed: () {
            controller.confirmAvailability(booking.bookingId, true);
          },
          child: const Text('Accept '),
        ),
      ),
    );
  }
}
