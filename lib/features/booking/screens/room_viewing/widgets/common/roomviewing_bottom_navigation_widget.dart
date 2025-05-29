import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../models/property/room.dart';

class RoomViewingBottomNavigationButtons extends StatelessWidget {
  final Room room;

  const RoomViewingBottomNavigationButtons({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Discard button
          TextButton(
            onPressed: () {
              // Add functionality to discard changes if needed
            },
            child: Row(
              children: [
                Text(
                  "K ${room.price.toInt().toString()}",
                  style:
                      TTypography.h4.copyWith(color: TColorSystem.primary100),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields / 4),
                Row(
                  children: [
                    Text(
                      "per",
                      style: TTypography.body10Regular.copyWith(
                        color: TColorSystem.n600,
                      ),
                    ),
                    const SizedBox(width: TSizes.spaceBtwItems / 8),
                    Text(
                      "night",
                      style: TTypography.body10Regular.copyWith(
                        color: TColorSystem.n600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: TSizes.spaceBtwItems / 2),

          // Save Changes button
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(TRoutes.bookingRequest, arguments: room);
              },
              child: const Text('Book'),
            ),
          ),
        ],
      ),
    );
  }
}
