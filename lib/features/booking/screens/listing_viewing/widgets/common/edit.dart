import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';

class Edit extends StatelessWidget {
  final String label;
  final void Function()? onTap;

  const Edit({
    super.key,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/custom_icons/icon_family/edit.svg",
            color: TColorSystem.primary500,
          ),
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
          Text(
            label,
            style:
                TTypography.label12Regular.copyWith(color: TColorSystem.n300),
          )
        ],
      ),
    );
  }
}
