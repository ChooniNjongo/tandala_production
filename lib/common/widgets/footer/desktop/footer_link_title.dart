import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/typography.dart';
import '../../../../utils/device/device_utility.dart';

class FooterSectionTitle extends StatelessWidget {
  final String title;

  const FooterSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return Column(
      children: [
        Text(
          title,
          style: TTypography.h5.copyWith(
              fontSize: isMobile ? 12 : 14, color: TColors.textDarkPrimary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,)
      ],
    );
  }
}
