import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/button_container/button_container.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../models/property/room.dart';

class RoomViewingButtonContainer extends StatelessWidget {
  final Room room;

  const RoomViewingButtonContainer({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ButtonContainer(
          button1: Row(
            children: [
              Text(
                "K ${room.price.toInt().toString()}",
                style: TTypography.h4.copyWith(color: TColorSystem.primary100),
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
          button2: SizedBox(
            width: TSizes.buttonWidth,
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(TRoutes.bookingRequest, arguments: room);
                },
                child: const Text('Book')),
          )),
    );
  }
}
