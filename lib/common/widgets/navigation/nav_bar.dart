import 'package:cwt_ecommerce_admin_panel/common/widgets/navigation/widgets/svg_nav_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 4),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: TColorSystem.n800, width: 1)),
          ),
          child: NavigationBar(
            selectedIndex: navController.selectedIndex.value,
            height: 56,
            elevation: 0,
            onDestinationSelected: (index) {
              navController.selectedIndex.value = index;
              switch (index) {
                case 0:
                  Get.toNamed(TRoutes.home);
                  break;
                case 1:
                  Get.toNamed(TRoutes.wishlist);
                  break;
                case 2:
                  Get.toNamed(TRoutes.listingStage);
                  break;
                case 3:
                  Get.toNamed(TRoutes.bookings);
                  break;
                case 4:
                  Get.toNamed(TRoutes.messages);
                  break;
              }
            },
            backgroundColor: TColors.primaryBackground,
            indicatorColor: Colors.transparent,
            destinations: [
              NavigationDestination(
                icon: SvgNavIcon(
                  navIcon: TImages.home,
                  isSelected: navController.selectedIndex.value == 0,
                ),
                label: "Home",
              ),
              NavigationDestination(
                icon: SvgNavIcon(
                  navIcon: TImages.heart,
                  isSelected: navController.selectedIndex.value == 1,
                ),
                label: "Wishlist",
              ),
              GestureDetector(
                onTap: () {
                  navController.selectedIndex.value = 2;
                  Get.toNamed(TRoutes.listingStage);
                },
                child: Container(
                  width: 40, // Adjusted width for a smaller circle
                  height: 40, // Adjusted height for a smaller circle
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          navController.selectedIndex.value == 2
                              ? TColorSystem.primary500
                              : TColorSystem.n700,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      TImages.plusCircle,
                      color:
                          navController.selectedIndex.value == 2
                              ? TColorSystem.primary500
                              : TColorSystem.n700,
                      height: 24, // Reduced icon size
                      width: 24, // Reduced icon size
                    ),
                  ),
                ),
              ),
              NavigationDestination(
                icon: SvgNavIcon(
                  notificationCount:
                      bookingController.numberOfUnCompletedBookings.value,
                  notificationColor: TColors.success,
                  count: true,
                  navIcon: TImages.shoppingBag,
                  isSelected: navController.selectedIndex.value == 3,
                ),
                label: "Bookings",
              ),
              NavigationDestination(
                icon: SvgNavIcon(
                  notificationCount: 3,
                  count: true,
                  navIcon: TImages.messageCircle,
                  isSelected: navController.selectedIndex.value == 4,
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
