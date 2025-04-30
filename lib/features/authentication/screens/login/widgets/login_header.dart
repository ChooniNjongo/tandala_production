import 'package:cwt_ecommerce_admin_panel/utils/constants/typography.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image(width: 150, height: 150, image: AssetImage(TImages.appLogo))),
          SizedBox(height: TSizes.spaceBtwSections),
          Text(TTexts.loginTitle, style: TTypography.h3),
          SizedBox(height: TSizes.sm),
          Text(TTexts.loginSubTitle, style: TTypography.label12Regular,)
        ],
      ),
    );
  }
}
