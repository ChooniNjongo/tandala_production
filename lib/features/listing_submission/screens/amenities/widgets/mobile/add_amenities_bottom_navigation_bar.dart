import 'package:flutter/material.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/typography.dart';

class AddAmenitiesBottomNavigationBar extends StatelessWidget {
  const AddAmenitiesBottomNavigationBar({super.key});

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
        ],
      ),
    );
  }
}
