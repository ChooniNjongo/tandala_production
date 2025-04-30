import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../routes/routes.dart';
import '../../utils/constants/color_system.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';
import '../../utils/constants/typography.dart';
import '../styles/spacing_styles.dart';
import '../widgets/buttons/full_width_button.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.onPressed,
  });

  final String image;
  final String title;
  final String subTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight * 2,
        child: Column(
          children: [
            /// Image
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.6,
              child: Lottie.asset(
                image,
                width: MediaQuery.of(context).size.width * 0.59,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            ///Title & Subtitle
            Text(
              title,
              style: TTypography.h3.copyWith(color: TColorSystem.n100),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              subTitle,
              style: TTypography.body14Regular.copyWith(
                color: TColorSystem.n500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.spaceBtwSections * 2),

            /// Let's Continue button
            TFullWidthElevatedButton(
              buttonLabel: TTexts.tContinue,
              onPressed: () {
                Get.toNamed(TRoutes.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
