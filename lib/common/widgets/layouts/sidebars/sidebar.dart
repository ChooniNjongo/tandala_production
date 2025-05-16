import 'package:cwt_ecommerce_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/controllers/booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'menu/menu_item.dart';

/// Sidebar widget for navigation menu
class TSidebar extends StatelessWidget {
  const TSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingController = BookingController.instance;
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          color: TColors.primaryBackground,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Logo
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.xl, vertical: 4),
                child: SvgPicture.asset(
                  TImages.tandalaColor,
                  height: 56,
                  width: 100,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                child: Obx(
                      () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('MENU',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(letterSpacingDelta: 1.2)),
                      // Menu Items
                      const TMenuItem(
                          route: TRoutes.places,
                          icon: Iconsax.home,
                          itemName: 'Places'),
                      TMenuItem(
                        route: TRoutes.bookings,
                        icon: Iconsax.reserve,
                        itemName: 'Bookings',
                        notificationCount:
                        bookingController.numberOfUnCompletedBookings.value,
                      ),
                      const TMenuItem(
                          route: TRoutes.messages,
                          icon: Iconsax.message,
                          itemName: 'Messages',
                          notificationCount: 9),
                      const TMenuItem(
                          route: TRoutes.wishlist,
                          icon: Iconsax.notification_favorite,
                          itemName: 'Wishlist'),
 /*                     const TMenuItem(
                          route: TRoutes.dashboard,
                          icon: Iconsax.status,
                          itemName: 'Dashboard'),*/
                      const TMenuItem(
                          route: TRoutes.media,
                          icon: Iconsax.image,
                          itemName: 'Media'),
/*                      const TMenuItem(
                          route: TRoutes.banners,
                          icon: Iconsax.picture_frame,
                          itemName: 'Banners'),*/
/*                      const TMenuItem(
                          route: TRoutes.listings,
                          icon: Iconsax.shopping_bag,
                          itemName: 'Listings'),*/
/*                      const TMenuItem(
                          route: TRoutes.categories,
                          icon: Iconsax.category_2,
                          itemName: 'Categories'),
                      const TMenuItem(
                          route: TRoutes.brands,
                          icon: Iconsax.dcube,
                          itemName: 'Brands'),
                      const TMenuItem(
                          route: TRoutes.customers,
                          icon: Iconsax.profile_2user,
                          itemName: 'Customers'),
                      const TMenuItem(
                          route: TRoutes.orders,
                          icon: Iconsax.box,
                          itemName: 'Orders'),
                      const TMenuItem(
                          route: TRoutes.coupons,
                          icon: Iconsax.code,
                          itemName: 'Coupons'),*/
                      const SizedBox(height: TSizes.spaceBtwItems),
                      Text('OTHER',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(letterSpacingDelta: 1.2)),
                      // Other menu items
                      const TMenuItem(
                          route: TRoutes.profile,
                          icon: Iconsax.user,
                          itemName: 'Profile'),
/*                      const TMenuItem(
                          route: TRoutes.settings,
                          icon: Iconsax.setting_2,
                          itemName: 'Settings'),*/

                      if (AuthenticationRepository.instance.authUser != null)
                        TMenuItem(
                          icon: Iconsax.logout,
                          itemName: 'Logout',
                          onTap: () async {
                            await AuthenticationRepository.instance.logout();
                          }, route: '',
                        )
                      else
                        const TMenuItem(
                            route: TRoutes.login,
                            icon: Iconsax.login,
                            itemName: 'Login'),
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
