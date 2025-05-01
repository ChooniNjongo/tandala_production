import 'package:cwt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';

class LoginScreenMobile extends StatelessWidget {
  const LoginScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primaryBackground,
      body: Container(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: TSizes.spaceBtwSections * 2),

              /// Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    TImages.appLogoSvg,
                    width: 160,
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections * 2),

              ///  Header
              const TLoginHeader(),

              /// Form
              const TLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
