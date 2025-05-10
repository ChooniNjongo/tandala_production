import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../../common/pages/action.dart';
import '../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../models/booking/booking.dart';
import '../widgets/mobile/body.dart';
import '../widgets/mobile/check_in_owner_buttons.dart';
import '../widgets/mobile/check_in_user_buttons.dart';

class CheckInMobileScreen extends StatelessWidget {
  final Booking booking;
  const CheckInMobileScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final uid = AuthenticationRepository.instance.authUser!.uid;
    return ActionPage(
      overlayHeader: const FormNavigation(
        step3Text: 'Step 3: Check In',
        initialValue: 0.5,
        targetValue: 0.75,
      ),
      body: CheckInBody(booking: booking),
      buttonContainer:
          uid == booking.listing.userId
              ? CheckInOwnerButtons(booking: booking)
              : CheckInUserButtons(booking: booking),
    );
  }
}
