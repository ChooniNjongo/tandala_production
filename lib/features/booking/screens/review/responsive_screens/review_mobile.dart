import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../../common/pages/action.dart';
import '../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../models/booking/booking.dart';
import '../widgets/mobile/body.dart';
import '../widgets/mobile/owner_review_buttons.dart';
import '../widgets/mobile/user_review_buttons.dart';

class ReviewMobileScreen extends StatelessWidget {
  final Booking booking;
  const ReviewMobileScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final uid = AuthenticationRepository.instance.authUser!.uid;
    return ActionPage(
      overlayHeader: const FormNavigation(
        step3Text: 'Step 4: Review',
        initialValue: 0.75,
        targetValue: 0.99,
      ),
      body: ReviewBody(
        booking: booking,
      ),
      buttonContainer: uid == booking.listing.userId
          ? OwnerReviewButtons(booking: booking)
          : UserReviewButtons(booking: booking),
    );
  }
}
