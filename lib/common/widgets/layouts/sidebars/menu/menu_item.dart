import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/color_system.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/typography.dart';
import '../sidebar_controller.dart';

class TMenuItem extends StatelessWidget {
  const TMenuItem({
    super.key,
    required this.route,
    required this.activeIcon,
    required this.itemName,
    required this.inActiveIcon,
  });

  final String route;
  final String activeIcon;
  final String inActiveIcon;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(SidebarController());
    return InkWell(
      onTap: () => menuController.menuOnTap(route),
      onHover:
          (hovering) =>
      hovering
          ? menuController.changeHoverItem(route)
          : menuController.changeHoverItem(''),
      child: Obx(
            () => Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color:
            menuController.isActive(route)
                ? TColorSystem.n200
                : menuController.isHovering(route)
                ? TColorSystem.n200
                : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
          ),
          child: SizedBox(
            height: 48,
            width: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child:
                  menuController.isActive(route)
                      ? SvgPicture.asset(
                    color: TColorSystem.primary500,
                    activeIcon,
                  )
                      : SvgPicture.asset(
                    inActiveIcon,
                    color: TColorSystem.n200,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 4),

                // Text
                if (menuController.isHovering(route) ||
                    menuController.isActive(route))
                  Flexible(
                    child: Row(
                      children: [
                        const SizedBox(width: TSizes.defaultSpaceDesktop),
                        Text(
                          itemName,
                          style: TTypography.body12Regular.apply(
                            color:
                            menuController.isActive(route)
                                ? TColorSystem.n200
                                : TColorSystem.n500,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Flexible(
                    child: Row(
                      children: [
                        const SizedBox(width: TSizes.defaultSpaceDesktop),
                        Text(
                          itemName,
                          style: TTypography.body12Regular.apply(
                            color: TColorSystem.n200,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
