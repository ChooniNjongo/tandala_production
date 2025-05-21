import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/booking_controller.dart';
import '../../../../controllers/review_controller.dart';
import '../../../../models/booking/booking.dart';
import '../../../../models/property/property_review.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';

class UserReviewBottomNavigationButtons extends StatelessWidget {
  final Booking booking;

  const UserReviewBottomNavigationButtons({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    final controller = BookingController.instance;
    final reviewController = Get.put(ReviewController());
    return TRoundedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Discard button
          OutlinedButton(
            child: const Text('Report'),
            onPressed: () {
              controller.confirmAvailability(booking.bookingId, false);
            },
          ),

          // Save Changes button
          Obx(() {
            final isDisabled = !reviewController.isDescriptionNotEmpty.value ||
                reviewController.rating.value == 0;

            return SizedBox(
              width: 160,
              child: ElevatedButton(
                onPressed: isDisabled
                    ? null
                    : () {
                  controller.submitPropertyReview(
                      PropertyReview(
                        listingId: booking.listing.listingId!,
                        bookingId: booking.bookingId,
                        userId: booking.bookieUserId,
                        userNameTruncated: '',
                        propertyName: booking.listing.propertyName,
                        dateTime: DateTime.now(),
                        rating: reviewController.rating.value,
                        review: reviewController.description.text,
                        reviewReply: '',
                      ),booking
                  );
                },
                child: const Text('Submit Review'),
              ),
            );
          }),
        ],
      ),
    );
  }
}


