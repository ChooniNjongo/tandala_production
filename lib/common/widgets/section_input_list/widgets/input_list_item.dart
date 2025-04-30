import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/color_system.dart';
import '../../../../utils/constants/typography.dart';

/// Widget representing a single input list item.
class TInputListItem extends StatelessWidget {
  final String inputListName;
  final Rx<bool> isSelected;

  const TInputListItem({
    super.key,
    required this.inputListName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Name of Input Item
        Text(inputListName,style: TTypography.body14Regular.copyWith(color: TColorSystem.n500),),

        /// Checkbox
        Obx(() => Checkbox(
          value: isSelected.value,
          onChanged: (value) {
            if (value != null) {
              isSelected.value = value; // Update the Rx<bool> value
            }
          },
          side: const BorderSide(
            color: Colors.white, // Set the border color to white
            width: 1.0, // Set the border width
          ),
        )),
      ],
    );
  }
}
