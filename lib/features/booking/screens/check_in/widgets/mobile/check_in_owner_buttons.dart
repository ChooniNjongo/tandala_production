import 'package:flutter/material.dart';

import '../../../../../../common/widgets/button_container/button_container.dart';
import '../../../../../../common/widgets/buttons/extensible_hug_content_button.dart';
import '../../../../../../common/widgets/buttons/t_text_button.dart';
import '../../../../controllers/booking_controller.dart';
import '../../../../models/booking/booking.dart';

class CheckInOwnerButtons extends StatelessWidget {
  final Booking booking;
  const CheckInOwnerButtons({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final controller = BookingController.instance;
    return ButtonContainer(
      button1: const TTextButton(
        label: 'Cancel Booking',
        labelColor: Colors.red,
      ),
      button2: SizedBox(),
    );
  }
}
