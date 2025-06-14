import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../utils/constants/sizes.dart';

class LogoAndSocialIcons extends StatelessWidget {
  const LogoAndSocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:TSizes.defaultSpaceDesktop ,vertical: 12),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Logo
            SizedBox(
              width: 100,
              height: 24,
              child: SvgPicture.asset(TImages.tandalaSvg,color: TColors.primary,),
            ),

            // Socials
            const Socials()
          ],
        ),
      ),
    );
  }
}

class Socials extends StatelessWidget {
  const Socials({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xFF1A2323)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              (TImages.twitterDark),
            ),
          ),
        ),
        const SizedBox(width: 8,),
        Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xFF1A2323)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              (TImages.facebookDark),
            ),
          ),
        ),
        const SizedBox(width: 8,),
        Container(
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xFF1A2323)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              (TImages.instagramDark),
            ),
          ),
        )
      ],
    );
  }
}
