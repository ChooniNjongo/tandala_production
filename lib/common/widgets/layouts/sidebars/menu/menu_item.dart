import 'package:cwt_ecommerce_admin_panel/utils/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/link.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../sidebar_controller.dart';

class TMenuItem extends StatelessWidget {
  const TMenuItem(
      {super.key,
      required this.route,
      required this.itemName,
      required this.icon,
      this.notificationCount = 0});

  final String route;
  final IconData icon;
  final String itemName;
  final int? notificationCount;


  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(SidebarController());
    return Link(
      uri: route != 'logout' ? Uri.parse(route) : null,
      builder: (_, __) => InkWell(
        onTap: () => menuController.menuOnTap(route),
        onHover: (value) => value
            ? menuController.changeHoverItem(route)
            : menuController.changeHoverItem(''),
        child: Obx(() {
          // Decoration Box
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
            child: Container(
              decoration: BoxDecoration(
                color: menuController.isHovering(route) ||
                        menuController.isActive(route)
                    ? TColors.secondaryBackground2
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
              ),

              // Icon and Text Row
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon
                      Padding(
                        padding: const EdgeInsets.only(
                            left: TSizes.lg,
                            top: TSizes.md,
                            bottom: TSizes.md,
                            right: TSizes.md),
                        child: menuController.isActive(route)
                            ? Icon(icon, size: 22, color: TColors.primary500)
                            : Icon(icon,
                                size: 22,
                                color: menuController.isHovering(route)
                                    ? TColors.primary500
                                    : TColors.primary500),
                      ),
                      // Text
                      if (menuController.isHovering(route) ||
                          menuController.isActive(route))
                        Flexible(
                          child: Text(itemName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(color: TColors.white)),
                        )
                      else
                        Flexible(
                          child: Text(itemName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(color: TColors.white)),
                        ),
                    ],
                  ),
                  if (notificationCount! > 0)
                    Positioned(
                        left: 36,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green),
                          child: Text(
                            notificationCount.toString(),
                            style: TTypography.label14Regular
                                .copyWith(color: Colors.white),
                          ),
                        ))
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
