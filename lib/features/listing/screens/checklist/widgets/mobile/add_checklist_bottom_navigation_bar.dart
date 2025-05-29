import 'package:cwt_ecommerce_admin_panel/utils/constants/color_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/popups/loaders.dart';
import '../../../../controllers/checklist_controller.dart';

class AddChecklistBottomNavigationBar extends StatelessWidget {
  const AddChecklistBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChecklistController());
    return TRoundedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Save Changes button
          SizedBox(
            width: 160,
            child: Obx(
              () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: !controller.hasSelectedAll.value
                      ? TColorSystem.n500 // or whatever disabled color
                      : TColors.primary500,
                ),
                onPressed: () {
                  if (!controller.hasSelectedAll.value) {
                    TLoaders.errorSnackBar(
                        message: "Pleaser select all requirements", title: "Requirements");
                  }
                  if (controller.hasSelectedAll.value) {
                    controller.startListing();
                    Get.toNamed(TRoutes.propertyType);
                  }

                },
                child: const Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
