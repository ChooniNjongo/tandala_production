import 'package:cwt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/desktop/search_bar/search_bar.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/controllers/nav_bar_controller.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/widgets/mobile/quick_filters_mobile.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../../../common/widgets/layouts/headers/mobile_header.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../controllers/secondary_filter_controller.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final filterController = Get.put(SecondaryFilterController());
    final menuController = Get.put(
      NavBarController(),
    ); // GetX MenuController
    return SliverAppBar(
      title: VisibilityDetector(
        key: const Key('mobile-header-key'),
        onVisibilityChanged: (VisibilityInfo info) {
          // Update menu icon visibility based on header visibility
          menuController.isNavBarVisible.value = info.visibleFraction > 0.0;
        },
        child: const MobileHeader(),
      ),
      automaticallyImplyLeading: false,
      // Remove back arrow
      leading: null,
      // Explicitly set leading to null
      expandedHeight: 160.0,
      titleSpacing: 0,
      floating: true,
      snap: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(top: 24),
        expandedTitleScale: 1.1,
        title: Container(
          color: TColors.primaryBackground,
          child: TRoundedContainer(
            showShadow: true,
            height: 48,
            backgroundColor: const Color(0xFFE5F7F9).withOpacity(0.1),
            radius: 32,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(TImages.search),
                    const SizedBox(width: TSizes.spaceBtwItems / 2),
                     Text(
                      "Start a search",
                      style: TextStyle(
                        fontFamily: 'InterDisplay',
                        fontWeight: FontWeight.w400,
                        color:  const Color(0xFFE5F7F9).withOpacity(0.5),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
