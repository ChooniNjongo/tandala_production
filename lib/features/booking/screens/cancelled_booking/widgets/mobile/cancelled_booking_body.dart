import 'package:cwt_ecommerce_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../models/booking/booking.dart';
import '../../../availability_check/widgets/mobile/booked_unit_images.dart';

class CancelledBookingBody extends StatelessWidget {
  final Booking booking;
  const CancelledBookingBody({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: TSizes.spaceBtwSections),
        const Text(
          "This booking was cancelled. You can always try again",
          style: TTypography.label12Regular,
        ),
        //Lottie file for success payment
        Lottie.asset(
          TImages.deleteAnimation, // Provide the correct Lottie file path
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),

        /// Image Container
        BookedUnitImages(booking: booking),
        const SizedBox(height: TSizes.spaceBtwSections),

        /// Booking Button

        if (AuthenticationRepository.instance.authUser!.uid !=
            booking.listing.userId)
          SizedBox(
            width: TSizes.buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(
                  TRoutes.destination,
                  arguments: {
                    'listing': booking.listing,
                    'isEditing': false, // Or true, depending on your use case
                  },
                );
              },
              child: const Text( "Book Again"),
            ),
          ),

      ],
    );
  }
}
