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
                fontFamily: "Inter",
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: TColorSystem.primary500,
                height: 13 / 10,
              );
            }
            return const TextStyle(
              fontFamily: "Inter",
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: TColorSystem.n700,
              height: 13 / 10,
            );
          }),
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 12),
          child: NavigationBar(
            selectedIndex: navController.selectedIndex.value,
            height: 56,
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
                case 4:
                  sidebarController.menuOnTap(TRoutes.createProduct);
                  break;
              }
            },
            backgroundColor: TColors.primaryBackground,
            indicatorColor: Colors.transparent,
            destinations: [
              NavigationDestination(
                icon: SvgNavIcon(
                  navIcon: TImages.home,
                  isSelected: sidebarController.activeItem.value == TRoutes.places,
                ),
                label: "Home",
              ),
              NavigationDestination(
                icon: SvgNavIcon(
                  navIcon: TImages.heart,
                  isSelected: sidebarController.activeItem.value == TRoutes.wishlist,
                ),
                label: "Wishlist",
              ),

              NavigationDestination(
                icon: Container(
                  width: 40, // Make sure width and height are equal to ensure a perfect circle
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:  sidebarController.activeItem.value == TRoutes.createListing? TColors.primary: TColorSystem.n700, // Change to your preferred color
                      width: 0.8, // Change to your preferred border width
                    ),
                  ),
                  child: Center( // Center the icon inside the circle
                    child: SvgNavIcon(
                      navIcon: TImages.plusCircle,
                      isSelected: sidebarController.activeItem.value == TRoutes.createListing,
                    ),
                  ),
                ),
                label: "",
              ),


              NavigationDestination(
                icon: SvgNavIcon(
                  notificationCount:
                      bookingController.numberOfUnCompletedBookings.value,
                  notificationColor: TColors.success,
                  count: true,
                  navIcon: TImages.shoppingBag,
                  isSelected: sidebarController.activeItem.value == TRoutes.bookingsHistory,
                ),
                label: "Bookings",
              ),
              NavigationDestination(
                icon: SvgNavIcon(
                  notificationCount: 0,
                  count: true,
                  navIcon: TImages.messageCircle,
                  isSelected: sidebarController.activeItem.value == TRoutes.messages,
                ),
                label: "Messages",
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
