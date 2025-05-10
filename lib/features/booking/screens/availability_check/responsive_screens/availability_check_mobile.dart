import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../../common/pages/action.dart';
import '../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../models/booking/booking.dart';
import '../widgets/mobile/body.dart';
import '../widgets/mobile/owner_buttons.dart';
import '../widgets/mobile/user_buttons.dart';

class AvailabilityCheckScreenMobile extends StatelessWidget {
  final Booking booking;

  const AvailabilityCheckScreenMobile({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final uid = AuthenticationRepository.instance.authUser!.uid;
    return ActionPage(
      overlayHeader: const FormNavigation(
        showLeftIcon: true,
        step3Text: 'Step 1: Checking Availability',
        initialValue: 0.0,
        targetValue: 0.25,
      ),
      body: AvailabilityCheckBody(booking: booking),
      buttonContainer:
          uid == booking.listing.userId
              ? OwnerButtons(booking: booking)
              : UserButtons(booking: booking),
    );
  }
}
