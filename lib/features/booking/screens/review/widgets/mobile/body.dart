import 'package:cwt_ecommerce_admin_panel/features/booking/screens/review/widgets/mobile/user_review_section.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../models/booking/booking.dart';
import 'owner_review_section.dart';

class ReviewBody extends StatelessWidget {
  final Booking booking;
  const ReviewBody({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    final uid = storage.read("uid") as String;
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: uid == booking.listing.userId
          ? const OwnerReviewSection()
          : const UserReviewSection(),
    );
  }
}
