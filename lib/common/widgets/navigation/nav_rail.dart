import 'package:cwt_ecommerce_admin_panel/common/widgets/navigation/widgets/svg_nav_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../styles/nav_label.dart';
import '../containers/rounded_container.dart';

class NavRail extends StatelessWidget {
  const NavRail({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavigationRailController());

    return Obx(
      () => NavigationRail(
          indicatorColor: Colors.transparent,
          labelType: NavigationRailLabelType.all,
          backgroundColor: TColors.primaryBackground,
          elevation: 1,
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: InkWell(
              onTap: () => scaffoldKey.currentState?.openDrawer(),
              child: TRoundedContainer(
                padding: const EdgeInsets.all(8),
                //  backgroundColor: TColors.dark,
                radius: 8,
                showShadow: false,
                showBorder: true,
                borderColor: TColors.borderPrimaryLight,
                child: SvgPicture.asset(TImages.menuDark,
                    height: 14, semanticsLabel: 'Menu Icon'),
              ),
            ),
          ),
          selectedIndex: navController.selectedIndex.value,
          onDestinationSelected: (index) {
            navController.selectedIndex.value = index;
            if (index == 0) {
              Get.toNamed(TRoutes.places);
            }
            if (index == 1) {
              Get.toNamed(TRoutes.bookings);
            }

            if (index == 2) {
              Get.toNamed(TRoutes.wishlist);
            }
            if (index == 3) {
              Get.toNamed(TRoutes.messages);
            }
          },
          destinations: [
            NavigationRailDestination(
                icon: SvgNavIcon(
                  navIcon: TImages.home,
                  isSelected: navController.selectedIndex.value == 0,
                ),
                label: Text(
                  "Home",
                  style: navTextStyle(navController.selectedIndex.value == 0),
                )),
            NavigationRailDestination(
                icon: SvgNavIcon(
                  navIcon: TImages.heart,
                  isSelected: navController.selectedIndex.value == 1,
                ),
                label: Text(
                  "Wishlist",
                  style: navTextStyle(navController.selectedIndex.value == 1),
                )),
            NavigationRailDestination(
                icon: SvgNavIcon(
                  navIcon: TImages.shoppingBag,
                  isSelected: navController.selectedIndex.value == 2,
                ),
                label: Text(
                  "Bookings",
                  style: navTextStyle(navController.selectedIndex.value == 2),
                )),
            NavigationRailDestination(
                icon: SvgNavIcon(
                  count: true,
                  navIcon: TImages.messageCircle,
                  isSelected: navController.selectedIndex.value == 3,
                ),
                label: Text(
                  "Messages",
                  style: navTextStyle(navController.selectedIndex.value == 3),
                )),
          ]),
    );
  }
}

class NavigationRailController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
}
