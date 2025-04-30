import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../common/pages/action.dart';
import '../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../models/booking/booking.dart';
import '../widgets/mobile/body.dart';
import '../widgets/mobile/payment_owner_buttons.dart';
import '../widgets/mobile/payment_user_buttons.dart';

class PaymentMobileScreen extends StatelessWidget {
  final Booking booking;
  const PaymentMobileScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    final uid = storage.read("uid") as String;
    return ActionPage(
      overlayHeader: const FormNavigation(
        showLeftIcon: true,
        step3Text: 'Step 2: Payment',
        initialValue: 0.25,
        targetValue: 0.5,
      ),
      body:  PaymentBody(booking: booking,),
      buttonContainer:
          uid == booking.listing.userId
              ? PaymentOwnerButtons(booking: booking)
              : PaymentUserButtons(booking: booking),
    );
  }
}
