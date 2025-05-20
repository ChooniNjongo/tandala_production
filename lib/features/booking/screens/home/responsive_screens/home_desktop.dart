import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/buttons/extensible_hug_content_button.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/footer/desktop/footer.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/property_controller.dart';
import '../widgets/common/quick_filters.dart';
import '../widgets/desktop/home_listings.dart';
import '../widgets/desktop/view_more_listings.dart';

class HomeDesktopScreen extends StatelessWidget {
  HomeDesktopScreen({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ListingsController());

    // Add a listener to detect when the user scrolls to the bottom
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isBottom = _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent;
        if (isBottom &&
            controller.hasTappedLoadingViewMore.value &&
            !controller.hasReachedTheLastPage.value) {
          // Call the function when scrolled to the bottom
          controller.onViewMoreListingsPressed();
        }
      }
    });

    return SingleChildScrollView(
      controller: _scrollController, // Attach the ScrollController
      child: TRoundedContainer(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        radius: 0,
        child: Obx(
          () => Column(
            children: [
              const QuickFilters(),
              const HomeListings(),
              // Product shimmer listings when loading else new TGrid with the new listings
              const ViewMoreListings(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              if (controller.showLoadingViewMore.value)
                TExtensibleHugContentButton(
                  buttonLabel: 'See more',
                  onPressed: () {
                    controller.hasTappedLoadingViewMore.value = true;
                    controller.showLoadingViewMore.value = false;
                    controller.onViewMoreListingsPressed();
                  },
                ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              if (!controller.hasTappedLoadingViewMore.value) const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
