import 'package:cwt_ecommerce_admin_panel/common/widgets/icons/favorite_icon.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/color_system.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/cards/property_cards/mobile/widgets/listing_distance.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../routes/routes.dart';
import '../../../../../utils/constants/image_strings.dart';
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
                Positioned(
                  top: 24,
                  left: 24,
                  child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Iconsax.arrow_left,
                        color: TColorSystem.n100,
                      )),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    children: [
                      TRoundedContainer(
                        padding: EdgeInsets.zero,
                        width: 40,
                        height: 40,
                        borderWidth: 1,
                        radius: 4,
                        showBorder: true,
                        borderColor: TColors.iconBorder,
                        child: FavoriteIcon(propertyId: listing.listingId!),
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      const TRoundedContainer(
                        padding: EdgeInsets.zero,
                        width: 40,
                        height: 40,
                        borderWidth: 1,
                        radius: 4,
                        showBorder: true,
                        borderColor: TColors.iconBorder,
                        child: Icon(Iconsax.share,color: TColorSystem.n100,),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Place Name
                  Text(
                    listing.propertyName,
                    style: TTypography.h3.copyWith(color: TColorSystem.n200),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListingNameLocation(listing: listing),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  ListingDistance(listing: listing),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
