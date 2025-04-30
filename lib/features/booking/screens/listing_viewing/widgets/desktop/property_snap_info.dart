import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/typography.dart';

class PropertySnapInfo extends StatelessWidget {
  const PropertySnapInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showShadow: true,
      width: 250,
      height: 330,
      showBorder: true,
      borderWidth: 0.4,
      borderColor: TColorSystem.n300,
      radius: 8,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          Row(
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.star,
                    color: TColors.primary500,
                    size: 24,
                  ),
                  Text(
                    '4.98',
                    style: TTypography.h3,
                  )
                ],
              ),
              const Spacer(),
              Text(
                "12 Reviews",
                style: TTypography.label12Regular.copyWith(color: TColorSystem.n600),
              )
            ],
          ),
          const Spacer(),
          const Text(
              "Experience comfort, elegance, and tranquility—your perfect home away from home. ",
              style: TTypography.h5,
              textAlign: TextAlign.center),
          const Spacer(),
          SvgPicture.asset('assets/logos/logos_google-maps.svg',
              height: 40, semanticsLabel: 'Get it on Google play Logo'),
          Text("Find this  place on Google maps",
              style: TTypography.label12Regular.copyWith(color: TColorSystem.n600),
              textAlign: TextAlign.center),
          const Spacer(),
          Text("This  property is 12 kilometres away from your location ",
              style: TTypography.label12Regular.copyWith(color: TColorSystem.n600),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
