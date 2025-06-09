import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/desktop/search_filter/search_filter.dart';
import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/mobile_search_icon_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/constants/color_system.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../containers/rounded_container.dart';

class MobileHeader extends StatelessWidget  {
  const MobileHeader({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final searchIconVisibilityController = Get.put(
      MobileSearchIconController(),
    );

    // compulsory dialog function
    final isMobile = TDeviceUtils.isMobileScreen(context);

    void showMobileFilter() {
      showModalBottomSheet(
        useSafeArea: true,
        barrierColor: TColors.lightGrey,
        backgroundColor: TColors.lightGrey,
        context: context,
        isScrollControlled: true,
        // Allows the sheet to expand fully
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), // Curve for the top-left corner
            topRight: Radius.circular(16), // Curve for the top-right corner
            bottomLeft: Radius.zero, // Straight bottom-left corner
            bottomRight: Radius.zero, // Straight bottom-right corner
          ),
        ),
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const SearchFilter(),
          );
        },
      );
    }

    void showCompulsoryDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: TColors.primaryBackground,
            shadowColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            content: const SearchFilter(),
          );
        },
        barrierDismissible: true,
      );
    }

    return TRoundedContainer(
      padding: const EdgeInsets.only(right: 40, left: 16, top: 12),
      radius: 0,
      borderWidth: 1,
      showShadow: false,
      height: 84,
      backgroundColor: TColors.primaryBackground,
      child: Row(
        children: [
          const SizedBox(width: TSizes.spaceBtwItems * 2),
          // Right: Tandala SVG logo
          InkWell(
            onTap: () => Get.toNamed(TRoutes.places),
            child: SvgPicture.asset(
              color: TColors.primary,
              TImages.tandalaSvg,
              height: 15,
              semanticsLabel: 'Logo',
            ),
          ),
          // Spacer for alignment
          const Spacer(),
          // Center: Search icon
          TRoundedContainer(
            onTap: () {
              searchIconVisibilityController.onSearchIconTapped();
              if (TDeviceUtils.isMobileScreen(context)) {
                showMobileFilter();
              }
              if (TDeviceUtils.isDesktopScreen(context)) {
                showCompulsoryDialog();
              }
            },
            padding: const EdgeInsets.all(8),
            radius: 100,
            backgroundColor: TColorSystem.n800,
            child: SvgPicture.asset(
              TImages.searchForAppBar,
              height: 24,
              semanticsLabel: 'Search Icon',
            ),
          ),
        ],
      ),
    );
  }
}
