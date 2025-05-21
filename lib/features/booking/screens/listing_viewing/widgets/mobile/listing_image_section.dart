import 'package:cwt_ecommerce_admin_panel/common/widgets/icons/favorite_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../models/property/listing_model.dart';
import '../common/edit.dart';
import 'm_listing_image_card.dart';

class ListingImageSection extends StatelessWidget {
  const ListingImageSection({
    super.key,
    required this.listing,
    required this.isEditing,
  });

  final ListingModel listing;
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.33,
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(TRoutes.photoGallery, arguments: listing);
            },
            child: Container(
              color: TColors.secondaryBackground2,
              child: MListingImageCard(listing: listing),
            ),
          ),
          Positioned(
              top: 8,
              right: 8,
              child: FavoriteIcon(propertyId: listing.listingId!)),
          Positioned(
            top: 24,
            left: 24,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Iconsax.arrow_left,
                color: TColorSystem.n100,
              ),
            ),
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
    );
  }
}
