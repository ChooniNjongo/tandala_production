import 'package:cwt_ecommerce_admin_panel/common/widgets/buttons/full_width_button.dart';
import 'package:cwt_ecommerce_admin_panel/routes/routes.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/color_system.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../../../utils/validators/validation.dart';
import '../../../../../common/widgets/chips/full_width_chip_label.dart';
import '../../../../../utils/constants/typography.dart';
import '../../../controllers/login_controller.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Column(
          children: [
            /// Google Login
            /// Continue with Google
            SizedBox(
              width: 380,
              child: FullWidthChipLabel(
                padding: EdgeInsets.zero,
                borderThickness: 0.67,
                radius: 8,
                label: 'Continue with Google',
                isSelected: false,
                leftIcon: TImages.google,
                onTap: () {},
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            const Text(
              "or",
              style: TTypography.label12Regular,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            /// Email
            Container(
              decoration: BoxDecoration(
                  color: TColors.secondaryBackground,
                  borderRadius: BorderRadius.circular(8)),
              child: SizedBox(
                height: 48,
                width: 370,
                child: TextFormField(
                  style: TTypography.label12Regular.copyWith(
                      color: TColors.textSecondary), // <-- input text style
                  controller: controller.email,
                  validator: TValidator.validateEmail,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: TColors.textSecondary,
                      ),
                      labelText: TTexts.email),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Password
            Obx(
              () => Container(
                decoration: BoxDecoration(
                    color: TColors.secondaryBackground,
                    borderRadius: BorderRadius.circular(8)),
                child: SizedBox(
                  height: 48,
                  width: 370,
                  child: TextFormField(
                    style: TTypography.label12Regular.copyWith(
                        color: TColors.textSecondary), // <-- input text style
                    obscureText: controller.hidePassword.value,
                    controller: controller.password,
                    validator: (value) =>
                        TValidator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: Icon(
                        Icons.password_sharp,
                        color: TColors.textSecondary,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            SizedBox(
              width: 370,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// Remember Me
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(() => Checkbox(
                          activeColor: TColorSystem.primary300,
                          value: controller.rememberMe.value,
                          onChanged: (value) =>
                              controller.rememberMe.value = value!)),
                      Text(
                        TTexts.rememberMe,
                        style:
                            TTypography.label12Regular.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
                width: 370,
                child: TFullWidthElevatedButton(
                  buttonLabel: "Log in",
                  onPressed: () => controller.emailAndPasswordSignIn(),
                )),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Forget Password
            TextButton(
                onPressed: () => Get.toNamed(TRoutes.forgetPassword),
                child: Text(
                  TTexts.forgetPassword,
                  style: TTypography.label12Regular.copyWith(
                      color: TColorSystem.primary500.withOpacity(0.6),
                      fontSize: 11),
                )),
          ],
        ),
      ),
    );
  }
}
