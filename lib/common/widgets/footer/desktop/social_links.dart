import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// Social Links
          SocialIconSvg(imageLight: TImages.facebookLight, imageDark:  TImages.facebookDark,),
          SocialIconSvg(imageLight: TImages.instagramLight, imageDark:  TImages.instagramDark,),
          SocialIconSvg(imageLight: TImages.twitterLight, imageDark:  TImages.twitterDark,),

        ],
      ),
    );
  }
}

class SocialIconSvg extends StatelessWidget {
  final String imageLight;
  final String imageDark;

  const SocialIconSvg({
    super.key,
    required this.imageLight,
    required this.imageDark,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SvgPicture.asset(
        dark ? imageDark : imageDark,
        height: 20,
        semanticsLabel: 'Download on Play Store logo');
  }
}
