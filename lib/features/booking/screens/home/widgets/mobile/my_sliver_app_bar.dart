import 'package:cwt_ecommerce_admin_panel/features/booking/controllers/nav_bar_controller.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/screens/home/widgets/common/quick_filters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../../../common/widgets/layouts/headers/mobile_header.dart';
import '../../../../../../utils/constants/colors.dart';
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
      expandedHeight: 108.0,
      titleSpacing: 0.0,
      floating: true,
      snap: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(top: 4),
        expandedTitleScale: 1.1,
        title: Container(
          color: TColors.primaryBackground,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => const QuickFilters(),
            ),
          ),
        ),
      ),
    );
  }
}
