import 'package:flutter/material.dart';
import '../../../../../../common/widgets/button_container/button_container.dart';
import '../../../../../../common/widgets/buttons/t_text_button.dart';
import '../../../../controllers/booking_controller.dart';
import '../../../../models/booking/booking.dart';

class PaymentOwnerButtons extends StatelessWidget {
  final Booking booking;

  const PaymentOwnerButtons({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final controller = BookingController.instance;
    return const ButtonContainer(
      button1: TTextButton(
        label: 'Cancel',
        labelColor: Colors.red,
      ),
      button2: SizedBox(),
    );
  }
}
