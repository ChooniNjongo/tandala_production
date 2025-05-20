import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/constants/color_system.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/typography.dart';
import 'menu/menu_item.dart';

class TSidebar extends StatelessWidget {
  const TSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepo = AuthenticationRepository.instance;

    // Check if user is logged in
    final bool isLoggedIn = authRepo.authUser != null;

    return Container(
      width: 302,
      decoration: const BoxDecoration(color: TColors.primaryBackground),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: TSizes.spaceBtwSections),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Icon(Iconsax.backward, color: TColorSystem.n200),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TMenuItem(
                route: TRoutes.account,
                activeIcon:
                TImages.material_symbols_settings_account_box_outline,
                itemName: 'Account',
                inActiveIcon:
                TImages.material_symbols_settings_account_box_outline,
              ),
              const TMenuItem(
                route: TRoutes.listings,
                activeIcon: TImages.teenyicons_search_property_outline,
                itemName: 'Listings',
                inActiveIcon: TImages.teenyicons_search_property_outline,
              ),
              const TMenuItem(
                route: TRoutes.sendSuggestion,
                activeIcon: TImages.iconoir_suggestion,
                itemName: 'Send suggestion',
                inActiveIcon: TImages.iconoir_suggestion,
              ),
              const TMenuItem(
                route: TRoutes.help,
                activeIcon: TImages.material_symbols_help_outline,
                itemName: 'Get help',
                inActiveIcon: TImages.material_symbols_help_outline,
              ),

              // Authentication UI - Show login or logout based on auth status
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: TSizes.spaceBtwSections * 3,
                ),
                child:
                isLoggedIn
                // Logout UI for logged in users
                    ? GestureDetector(
                  onTap: () async {
                    await authRepo.logout();
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout_outlined,
                        size: 24,
                        color: TColorSystem.n200,
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems + 6),
                      Text(
                        "Logout",
                        style: TTypography.body12Regular.copyWith(
                          color: TColorSystem.n200,
                        ),
                      ),
                    ],
                  ),
                )
                // Login UI for logged out users
                    : GestureDetector(
                  onTap: () {
                    Get.toNamed(TRoutes.loginIntro);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.login_outlined,
                        size: 24,
                        color: TColorSystem.n200,
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems + 6),
                      Text(
                        "Login",
                        style: TTypography.label12Regular.copyWith(
                          color: TColorSystem.n200,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
