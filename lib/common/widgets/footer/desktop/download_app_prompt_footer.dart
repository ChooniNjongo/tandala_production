import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/color_system.dart';
import '../../../../utils/helpers/helper_functions.dart';

class DownloadAppPromptFooter extends StatelessWidget {
  const DownloadAppPromptFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        Text(
          "Download our app to get started",
          style: Theme.of(context).textTheme.labelSmall?.apply(color:TColorSystem.n300 ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
                dark ? TImages.appStoreLogoDark : TImages.appStoreLogoLight,
                height: 40,
                semanticsLabel: 'Download on Play Store logo'),
            const SizedBox(
              width: TSizes.spaceBtwInputFields,
            ),
            SvgPicture.asset(
                dark ? TImages.googlePlayLogoDark : TImages.googlePlayLogoLight,
                height: 40,
                semanticsLabel: 'Get it on Google play Logo'),
          ],
        ),
      ],
    );
  }
}
