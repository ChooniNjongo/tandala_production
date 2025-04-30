import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/button_container/button_container.dart';
import '../../../../../../common/widgets/buttons/extensible_hug_content_button.dart';
import '../../../../../../common/widgets/buttons/t_text_button.dart';
import '../../../../../../routes/routes.dart';
import '../../../../controllers/booking_controller.dart';
import '../../../../models/booking/booking.dart';

class CancelledBookingOwnerButtons extends StatelessWidget {
  final Booking booking;

  const CancelledBookingOwnerButtons({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final controller = BookingController.instance;
    return ButtonContainer(
      button1: TTextButton(
        label: 'Report',
        labelColor: Colors.red,
        onPressed: () {
          controller.confirmAvailability(booking.bookingId, false);
        },
      ),
      button2: SizedBox(),
    );
  }
}
