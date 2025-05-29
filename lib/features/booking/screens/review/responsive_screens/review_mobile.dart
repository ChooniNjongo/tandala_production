import 'package:flutter/material.dart';
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

    return Scaffold(
      body: SingleChildScrollView(
        child: ReviewBody(
          booking: booking,
        ),
      ),
      bottomNavigationBar: uid == booking.listing.userId
          ? OwnerReviewBottomNavigationButtons(booking: booking)
          : UserReviewBottomNavigationButtons(booking: booking),
    );
  }
}
