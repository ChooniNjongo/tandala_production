import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';


class AuthenticationPage extends StatelessWidget {
  final Widget authInput;
  final Widget authAlternativeAction;
  final String label;

  const AuthenticationPage({
    super.key, required this.authInput, required this.authAlternativeAction, required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpaceDesktop),
            child: Column(
              children: [
                SvgPicture.asset(
                  TImages.darkAppLogo,
                  height: 24,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections * 2,
                ),

                /// Login Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 16,
                      width: 3,
                      color: TColors.primary,
                    ),
                    const SizedBox(
                      width: TSizes.spaceBtwItems / 2,
                    ),
                     Text(
                      label,
                      style: const TextStyle(
                          fontFamily: 'Lora',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.white),
                    ),
                  ],
                ),

                /// Space
                const SizedBox(height: TSizes.spaceBtwSections * 2),


                /// Authentication Input
                authInput,
                const SizedBox(height: TSizes.spaceBtwSections,),
                /// Alternative Action
                authAlternativeAction,
                const SizedBox(height: TSizes.spaceBtwSections,)
              ],
            ),
          ),
        ));
  }
}
