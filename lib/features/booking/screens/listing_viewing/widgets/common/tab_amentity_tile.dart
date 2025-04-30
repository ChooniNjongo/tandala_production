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
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          SvgPicture.asset(
            svgIcon,
            color: Colors.white.withOpacity(1),
            height: 24,
          ),
          const SizedBox(width: TSizes.spaceBtwItems),
          Text(amenityTitle,
              style: TTypography.label12Regular
                  .copyWith(color: Colors.white.withOpacity(1))),
        ],
      ),
    );
  }
}
