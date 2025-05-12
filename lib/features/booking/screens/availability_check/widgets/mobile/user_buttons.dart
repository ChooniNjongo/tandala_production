import 'package:cwt_ecommerce_admin_panel/utils/constants/color_system.dart';
import 'package:flutter/material.dart';
import '../../../../../../common/widgets/button_container/button_container.dart';
import '../../../../../../common/widgets/buttons/t_text_button.dart';
import '../../../../../../common/widgets/dialog/t_dialog.dart';
import '../../../../controllers/booking_controller.dart';
import '../../../../models/booking/booking.dart';

class UserButtons extends StatelessWidget {
  final Booking booking;

  const UserButtons({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final controller = BookingController.instance;
    return ButtonContainer(
      button1: TTextButton(
        icon: Icons.cancel_outlined,
        showIcon: true,
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
        label: 'Cancel Booking',
        labelColor: TColorSystem.n400,
      ),
      button2: const SizedBox(),
    );
  }
}
