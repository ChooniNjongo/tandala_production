import 'package:flutter/material.dart';
import '../../../../../../common/widgets/button_container/button_container.dart';
import '../../../../../../common/widgets/buttons/t_text_button.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../controllers/booking_controller.dart';
import '../../../../models/booking/booking.dart';

class CancelledBookingOwnerButtons extends StatelessWidget {
  final Booking booking;

  const CancelledBookingOwnerButtons({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final controller = BookingController.instance;
    return ButtonContainer(
      button1:  TTextButton(
        showIcon: true,
        icon: Icons.cancel_outlined,
        label: 'Report',
        labelColor: TColorSystem.n400,
        onPressed: () {
          controller.cancelBooking(booking.bookingId);
        },
      ),
      button2: const SizedBox(),
    );
  }
}
