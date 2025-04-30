import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Listing Image Card
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(TRoutes.photoGallery, arguments: listing);
                  },
                  child: MListingImageCard(listing: listing),
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
                      ListingNameLocation(listing: listing),
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
                  const SizedBox(height: 7),
                  ActionButtons(listing: listing),
                  const SizedBox(height: 6),
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
