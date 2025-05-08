import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import '../../../../../common/widgets/cards/property_cards/mobile/widgets/listing_distance.dart';
import '../../../../../routes/routes.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/property/listing_model.dart';
import '../widgets/common/action_buttons.dart';
import '../widgets/common/edit.dart';
import '../widgets/common/listing_name_location.dart';
import '../widgets/mobile/m_listing_image_card.dart';
import '../widgets/mobile/mobile_tab_view.dart';

class ListingViewingMobileScreen extends StatelessWidget {
  const ListingViewingMobileScreen({
    super.key,
    required this.isEditing,
    required this.listing,
  });

  final bool isEditing;
  final ListingModel listing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.defaultSpace,
                  vertical: TSizes.spaceBtwItems),
              child: Column(
                children: [
                  TBreadcrumbsWithHeading(
                    returnToPreviousScreen: true,
                    breadcrumbItems: const ['Destination'],
                    heading: listing.propertyName,
                  ),
                ],
              ),
            ),

            /// Listing Image Card
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(TRoutes.photoGallery, arguments: listing);
                  },
                  child: Container(
                      decoration: const BoxDecoration(
                          color: TColors.secondaryBackground2),
                      child: MListingImageCard(listing: listing)),
                ),
                if (isEditing)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Edit(
                      label: 'edit photos',
                      onTap: () {
                        Get.toNamed(TRoutes.uploadPhotos);
                      },
                    ),
                  ),
              ],
            ),

            /// Listing Name and Location
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListingNameLocation(listing: listing),
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          ListingDistance(listing: listing),
                        ],
                      ),
                      const SizedBox(width: TSizes.spaceBtwSections),
                      if (isEditing)
                        Edit(
                          label: 'edit name',
                          onTap: () {
                            Get.toNamed(TRoutes.nameAndCity);
                          },
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  ActionButtons(listing: listing),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  // Tab Bar
                ],
              ),
            ),
            MobileTabView(listing: listing, isEditing: isEditing),
          ],
        ),
      ),
    );
  }
}
