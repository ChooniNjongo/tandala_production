import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/desktop/search_filter/search_filter.dart';
import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/mobile_search_icon_controller.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/personalization/controllers/user_controller.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../appbar/appbar.dart';
import '../../images/t_rounded_image.dart';
import '../../shimmers/shimmer.dart';

/// Header widget for the application
class THeader extends StatelessWidget implements PreferredSizeWidget {
  const THeader({
    super.key,
    required this.scaffoldKey,
  });

  /// GlobalKey to access the Scaffold state
  final GlobalKey<ScaffoldState> scaffoldKey;



  @override
  Widget build(BuildContext context) {
    void showMobileFilter() {
      showModalBottomSheet(
        useSafeArea: true,
        barrierColor: TColors.lightGrey,
        backgroundColor: TColors.lightGrey,
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
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
    final searchIconVisibilityController = Get.put(MobileSearchIconController());
    final controller = UserController.instance;
    return Container(
      /// Background Color, Bottom Border
      decoration: const BoxDecoration(
        color: TColors.primaryBackground,
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.md, vertical: TSizes.sm),
      child: TAppBar(
        /// Mobile Menu
       // leadingIcon: !TDeviceUtils.isDesktopScreen(context) ? Iconsax.menu : null,
        leadingOnPressed: !TDeviceUtils.isDesktopScreen(context)
            ? () => scaffoldKey.currentState?.openDrawer()
            : null,
        title: Row(
          children: [
            /// Logo
            GestureDetector(
              onTap: ()=> Get.toNamed(TRoutes.places),
              child: SvgPicture.asset(
                color: TColors.primary,
                TImages.tandalaSvg,
                height: 18,
                width: 32,
              ),
            ),
          ],
        ),
        actions: [


          // Search Icon on Mobile
          if (!TDeviceUtils.isDesktopScreen(context))
            IconButton(
                icon: const Icon(Iconsax.search_normal), onPressed: () {

              searchIconVisibilityController.onSearchIconTapped();
              if (TDeviceUtils.isMobileScreen(context)) {
                showMobileFilter();
              }
              if (TDeviceUtils.isDesktopScreen(context)) {
                showCompulsoryDialog();
              }
            }),

          // Notification Icon
          IconButton(icon: const Icon(Iconsax.notification), onPressed: () {}),
          const SizedBox(width: TSizes.spaceBtwItems / 2),

          /// User Data
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// User Profile Image
              Obx(
                () => TRoundedImage(
                  width: 40,
                  padding: 2,
                  height: 40,
                  fit: BoxFit.cover,
                  imageType: controller.user.value.profilePicture.isNotEmpty
                      ? ImageType.network
                      : ImageType.asset,
                  image: controller.user.value.profilePicture.isNotEmpty
                      ? controller.user.value.profilePicture
                      : TImages.user,
                ),
              ),

              const SizedBox(width: TSizes.sm),

              /// User Profile Data [Hide on Mobile]
              if (!TDeviceUtils.isMobileScreen(context))
                Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.loading.value
                          ? const TShimmerEffect(width: 50, height: 13)
                          : Text(controller.user.value.fullName,
                              style: Theme.of(context).textTheme.titleLarge),
                      controller.loading.value
                          ? const TShimmerEffect(width: 70, height: 13)
                          : Text(controller.user.value.email,
                              style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                ),
              IconButton(
                  icon: const Icon(Iconsax.menu),
                  onPressed: () {
                    scaffoldKey.currentState?.openDrawer();
                  }),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(TDeviceUtils.getAppBarHeight() + 15);
}
