import 'package:cwt_ecommerce_admin_panel/features/booking/screens/review/widgets/mobile/user_review_section.dart';
import 'package:flutter/material.dart';
import '../../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/booking/booking.dart';
import 'owner_review_section.dart';

class ReviewBody extends StatelessWidget {
  final Booking booking;
  const ReviewBody({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final uid = AuthenticationRepository.instance.authUser!.uid;
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpaceDesktop),
      child: uid == booking.listing.userId
          ?  OwnerReviewSection(booking: booking,)
          :  UserReviewSection(booking: booking,),
    );
  }
}
