import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../routes/routes.dart';
import '../../../../../utils/constants/color_system.dart';
import '../../../../../utils/constants/typography.dart';

class AddRoomBottomNavigationBar extends StatelessWidget {
  const AddRoomBottomNavigationBar({super.key});

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
            child: Text(
              "Cancel",
              style: TTypography.h4.copyWith(color: TColorSystem.primary100),
            ),
          ),

          // Save Changes button
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(TRoutes.location);
              },
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}
