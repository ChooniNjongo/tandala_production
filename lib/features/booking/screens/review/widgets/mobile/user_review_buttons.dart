import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/button_container/button_container.dart';
import '../../../../../../common/widgets/buttons/extensible_hug_content_button.dart';
import '../../../../../../common/widgets/buttons/t_text_button.dart';
import '../../../../controllers/booking_controller.dart';
import '../../../../controllers/review_controller.dart';
import '../../../../models/booking/booking.dart';
import '../../../../models/property/property_review.dart';

class UserReviewButtons extends StatelessWidget {
  final Booking booking;
  const UserReviewButtons({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final controller = BookingController.instance;
    final reviewController = Get.put(ReviewController());
    return ButtonContainer(
      button1: const TTextButton(label: 'Report', labelColor: Colors.red),
      button2: TExtensibleHugContentButton(
        buttonLabel: 'Submit Review',
        onPressed: () {
          controller.submitPropertyReview(
            PropertyReview(
              listingId: booking.listing.listingId!,
              bookingId: booking.bookingId,
              userId: booking.bookieUserId,
              userNameTruncated: '',
              propertyName: booking.listing.propertyName,
              dateTime: DateTime.now(),
              rating: reviewController.rating.toInt(),
              review: reviewController.reviewTextEditingController.text,
              reviewReply: '',
            ),
          );
        },
      ),
    );
  }
}
