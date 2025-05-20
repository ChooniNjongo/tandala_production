import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/button_container/button_container.dart';
import '../../../../../../common/widgets/buttons/t_text_button.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/sizes.dart';
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
      button1: TTextButton(
        label: 'Report',
        labelColor: TColorSystem.n400,
        onPressed: () {
          controller.confirmAvailability(booking.bookingId, false);
        },
      ),
      button2: Obx(() {
        final isDisabled = !reviewController.isDescriptionNotEmpty.value ||
            reviewController.rating.value == 0;

        return SizedBox(
          width: TSizes.buttonWidth,
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
    );
  }
}
