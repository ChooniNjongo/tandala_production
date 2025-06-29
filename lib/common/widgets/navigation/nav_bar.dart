import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:cwt_ecommerce_admin_panel/common/widgets/navigation/widgets/svg_nav_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/booking/controllers/booking_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/constants/color_system.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavigationController());
    final bookingController = Get.put(BookingController());
    final sidebarController = Get.put(SidebarController());

    return Obx(
      () => NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                fontFamily: "InterDisplay",
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color(0xFF00AFC1),
                height: 1.2,
              );
            }
            return const TextStyle(
              fontFamily: "InterDisplay",
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: TColors.textPrimary ,
              height: 1.2,
            );
          }),
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 24, top: 24),
          child: NavigationBar(
            selectedIndex: navController.selectedIndex.value,
            elevation: 0,
            onDestinationSelected: (index) {
              navController.selectedIndex.value = index;
              switch (index) {
                case 0:
                  sidebarController.menuOnTap(TRoutes.places);
                  break;
                case 1:
                  sidebarController.menuOnTap(TRoutes.wishlist);
                  break;
                case 2:
                  sidebarController.menuOnTap(TRoutes.listingStage);
                  break;
                case 3:
                  sidebarController.menuOnTap(TRoutes.activeBookings);
                  break;
              }
            },
            backgroundColor: TColors.primaryBackground,
            indicatorColor: Colors.transparent,
            destinations: [
              NavigationDestination(
                icon: SvgNavIcon(
                  navIcon: TImages.bottomNavbarPlaces,
                  isSelected: sidebarController.activeItem.value == TRoutes.places,
                ),
                label: "Home",
              ),
              NavigationDestination(
                icon: SvgNavIcon(
                  navIcon: TImages.bottomNavbarBookings,
                  isSelected: sidebarController.activeItem.value == TRoutes.activeBookings,
                ),
                label: "Bookings",
              ),



              NavigationDestination(
                icon: SvgNavIcon(
                  notificationCount:
                      0,
                  notificationColor: TColors.success,
                  count: true,
                  navIcon: TImages.bottomNavbarWishlist,
                  isSelected: sidebarController.activeItem.value == TRoutes.bookingsHistory,
                ),
                label: "Wishlist",
              ),
              NavigationDestination(
                icon: SvgNavIcon(
                  notificationCount: 0,
                  count: true,
                  navIcon: TImages.bottomNavbarAccount,
                  isSelected: sidebarController.activeItem.value == TRoutes.messages,
                ),
                label: "Account",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
}
