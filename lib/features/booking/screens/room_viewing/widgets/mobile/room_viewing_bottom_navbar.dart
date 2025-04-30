import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../models/property/room.dart';

class RoomViewingBottomNavbar extends StatelessWidget {
  final Room room;


  const RoomViewingBottomNavbar({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 0.4,
            width: double.infinity,
            color: const Color(0xFF404747),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: "K${room.price}",
                        style: TTypography.h4.copyWith(
                            color: TColorSystem.white.withOpacity(1) ),
                      ),
                      TextSpan(
                        text: ' night',
                        style: TTypography.label12Regular.copyWith(
                          fontWeight: FontWeight.w200,
                            color: TColorSystem.white.withOpacity(0.7)),
                      ),

                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(TRoutes.bookingRequest);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 64, vertical: 12), // Adjust padding here
                    foregroundColor: Colors.white, // Set button color to white
                    backgroundColor: TColors.primary500, // Text color
                  ),
                  child: Text(
                    'Book',
                    style: TTypography.label16Bold.copyWith(color: TColorSystem.n100),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
