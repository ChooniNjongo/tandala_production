import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../controllers/name_and_city_controller.dart';

class NameCityBottomNavigationBar extends StatelessWidget {
  const NameCityBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NameAndCityStepController());

    return TRoundedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Cancel button
          TextButton(
            onPressed: () {
              // Add functionality to discard changes if needed
              Get.back();
            },
            child: Text(
              "Cancel",
              style: TTypography.body12Regular.copyWith(color: TColors.warning),
            ),
          ),

          // Continue button - disabled when requirements are not met
          Obx(() {
            return SizedBox(
              width: 160,
              child: ElevatedButton(
                onPressed: controller.stepRequirementsMet.value
                    ? () => controller.addNameAndCityDetails()
                    : null, // null disables the button
                child: const Text('Continue'),
              ),
            );
          }),
        ],
      ),
    );
  }
}