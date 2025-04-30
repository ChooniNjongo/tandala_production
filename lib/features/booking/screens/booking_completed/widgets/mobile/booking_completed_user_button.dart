import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/button_container/button_container.dart';
import '../../../../../../common/widgets/buttons/extensible_hug_content_button.dart';
import '../../../../../../routes/routes.dart';
import '../../../../models/booking/booking.dart';

class BookingCompletedUserButtons extends StatelessWidget {
  final Booking booking;

  const BookingCompletedUserButtons({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      button1: const SizedBox(),
      button2: TExtensibleHugContentButton(
        buttonLabel: 'Book Again ',
        onPressed: () {
          Get.toNamed(
            TRoutes.listingViewing,
            arguments: {
              'listing': booking.listing,
              'isEditing': false, // Or true, depending on your use case
            },
          );
        },
      ),
    );
  }
}
