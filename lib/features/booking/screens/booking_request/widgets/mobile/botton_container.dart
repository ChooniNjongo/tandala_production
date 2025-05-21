import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../controllers/booking_controller.dart';
import '../../../../models/booking/booking_request.dart';
import '../../../../models/property/room.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';

class BookingRequestBottomNavigationButtons extends StatelessWidget {
  final Room room;

  const BookingRequestBottomNavigationButtons({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    final controller = BookingController.instance;
    controller.bookingTotal.value = room.price.toInt();
    return TRoundedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Discard button
          OutlinedButton(
            onPressed: () {
              // Add functionality to discard changes if needed
            },
            child: Obx(
              () => Row(
                children: [
                  Row(
                    children: [
                      Text(
                        "K${controller.bookingTotal.value.toString()}",
                        style: TTypography.h4.copyWith(
                          color: TColorSystem.primary100,
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),
                      Text(
                        'for',
                        style: TTypography.body10Regular.copyWith(
                          color: TColorSystem.n600,
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems / 4),
                      Text(
                        controller.numberOfNightBooked.value.toString(),
                        style:
                            TTypography.h4.copyWith(color: TColorSystem.n600),
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems / 4),
                      Text(
                        controller.numberOfNightBooked.value == 1
                            ? "night"
                            : "nights",
                        style: TTypography.body10Regular.copyWith(
                          color: TColorSystem.n600,
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems / 4),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Save Changes button
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                controller.submitBookingRequest(
                  BookingRequest(
                    bookieUserId:
                        AuthenticationRepository.instance.authUser?.uid,
                    listingId: room.listingId,
                    numberOfNights: controller.numberOfNightBooked.value,
                    roomId: room.roomId!,
                    checkInDate: controller.checkInDate.value,
                    checkOutDate: controller.checkOutDate.value,
                  ),
                );
              },
              child: const Text('Check Availability'),
            ),
          ),
        ],
      ),
    );
  }
}
