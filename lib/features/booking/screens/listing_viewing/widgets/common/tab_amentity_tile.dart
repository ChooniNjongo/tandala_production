import 'package:cwt_ecommerce_admin_panel/utils/constants/color_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';

class TabAmenityTile extends StatelessWidget {
  const TabAmenityTile(
      {super.key, required this.svgIcon, required this.amenityTitle});

  final String svgIcon;
  final String amenityTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SvgPicture.asset(
            svgIcon,
            color: TColorSystem.primary300,
            height: 18,
          ),
          const SizedBox(width: TSizes.spaceBtwItems),
          Text(amenityTitle,
              style: TTypography.body10Regular
                  .copyWith(color: TColorSystem.n500)),
        ],
      ),
    );
  }
}
