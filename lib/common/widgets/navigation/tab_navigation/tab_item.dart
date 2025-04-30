import 'package:flutter/material.dart';

import '../../../../utils/constants/color_system.dart';
import '../../../../utils/constants/typography.dart';

class TabItem extends StatelessWidget {
  const TabItem(
      {super.key, required this.label, this.isSelected = false, this.onTap});

  final String label;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: isSelected ? TColorSystem.n200 : Colors.transparent,
                width: 2), // Example bottom border
          ),
        ),
        child: Text(
          label,
          style: TTypography.label14Regular.copyWith(
              color: isSelected
                  ? TColorSystem.n200
                  : TColorSystem.n700), // Example text style
        ),
      ),
    );
  }
}
