import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class FooterBottomText extends StatelessWidget {
  const FooterBottomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: TSizes.spaceBtwSections,),
        SvgPicture.asset(
          TImages.mobileFooterLogo,
          semanticsLabel: "Mobile footer logo",
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              TImages.ic_sharp_copyright,
              semanticsLabel: "Copy right",
            ),
            const SizedBox(width: 4),
            Text(
              "${DateTime.now().year} ${TTexts.copyRight}",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontFamily: 'Inter',
                  fontSize: 10,
                  height: 1.5,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwSections * 4,)
      ],
    );
  }
}
