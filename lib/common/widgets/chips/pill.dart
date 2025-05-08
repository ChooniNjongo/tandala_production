import 'package:flutter/material.dart';

import '../../../utils/constants/color_system.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/typography.dart';
import '../containers/rounded_container.dart';

class TPill extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isSelected;

  const TPill({
    super.key,
    required this.title,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        onTap: onTap,
        backgroundColor: isSelected ? TColors.primary500 : TColors.secondaryBackground2,
        radius: 40,
       // borderWidth: 0.6,
       // showBorder: true,
        borderColor: isSelected ? TColors.primary500 : TColorSystem.n600,
        child: Text(
          title,
          style: TTypography.body16Bold.copyWith(
            color: isSelected ? TColorSystem.n100 : TColorSystem.n500,
          ),
        ));
  }
}
