import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/cards/property_cards/mobile/property_card_mobile.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../utils/constants/color_system.dart';
import '../../../../../utils/constants/typography.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/search_filter_controller.dart';
import '../../home/widgets/mobile/my_sliver_app_bar.dart';

class SearchResultsMobile extends StatelessWidget {
  const SearchResultsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFilterController());

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Top Filter SliverAppBar
          const MySliverAppBar(),

          /// Search Results Count (wrapped in SliverToBoxAdapter)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 24, left: 12),
              child: Obx(
                () => controller.isLoading.value
                    ? Row(
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: TColorSystem.primary300,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Loading...",
                            style: TTypography.label12Regular.apply(
                              color: TColorSystem.primary300,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        "Search results (${controller.listings.length})",
                        style: TTypography.label12Regular.apply(
                          color: TColorSystem.primary300,
                        ),
                      ),
              ),
            ),
          ),

          MobileBodySlivers(),
        ],
      ),
    );
  }
}

class MobileBodySlivers extends StatelessWidget {
  const MobileBodySlivers({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFilterController());
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Obx(() {
          if (controller.isLoading.value) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: TGridLayout(
                crossAxisCount: isMobile ? 1 : 3,
                mainAxisExtent: 340,
                itemCount: 12,
                itemBuilder: (_, index) => const TVerticalProductShimmer(),
              ),
            );
          }

          if (controller.listings.isEmpty) {
            return Center(
              child: Text(
                'No Properties Found. Try another search criteria',
                style: TTypography.body14Regular.apply(
                  color: TColorSystem.n200,
                ),
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 12 : 40,
              vertical: 32,
            ),
            child: TGridLayout(
              crossAxisCount: isMobile ? 1 : 3,
              mainAxisExtent: 360,
              itemCount: controller.listings.length,
              itemBuilder: (_, index) =>
                  PropertyCardMobile(listing: controller.listings[index]),
            ),
          );
        });
      }, childCount: 1),
    );
  }
}
