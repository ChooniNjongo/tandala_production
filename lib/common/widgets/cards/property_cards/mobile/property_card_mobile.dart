import 'package:cwt_ecommerce_admin_panel/common/widgets/cards/property_cards/mobile/widgets/listing_distance.dart';
import 'package:cwt_ecommerce_admin_panel/common/widgets/cards/property_cards/mobile/widgets/listing_name_and_city.dart';
import 'package:cwt_ecommerce_admin_panel/common/widgets/cards/property_cards/mobile/widgets/listing_price.dart';
import 'package:cwt_ecommerce_admin_panel/common/widgets/cards/property_cards/mobile/widgets/listing_rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../features/booking/controllers/location_controller.dart';
import '../../../../../features/booking/controllers/property_controller.dart';
import '../../../../../features/booking/models/property/listing_model.dart';
import '../../../../../routes/routes.dart';
import '../../../../../utils/constants/color_system.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/typography.dart';
import '../../../containers/rounded_container.dart';
import '../../../icons/favorite_icon.dart';
import '../../image_sliders/home_property_image_slider.dart';

class PropertyCardMobile extends StatelessWidget {
  const PropertyCardMobile({super.key, required this.listing});

  final ListingModel listing;

  @override
  Widget build(BuildContext context) {
    final locationController = Get.put(LocationController());
    final listingsController = Get.put(ListingsController());
    return Column(
      children: [
        TRoundedContainer(
          onTap: () {
            Get.toNamed(TRoutes.listingViewing, arguments: {
              'listing': listing,
              'isEditing': false // Or true, depending on your use case
            });
          },
          margin: EdgeInsets.zero,
          showShadow: false,
          backgroundColor: TColors.primaryBackground,
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: [
              PropertyHomeImageSlider(property: listing),

              /// Favorite Icon Button with hover effect
              FavoriteIcon(
                propertyId: listing.listingId!,
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListingName(listing: listing),
                if (listing.rating != 0.0) ListingRating(listing: listing),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 4),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(listing.city,
                      style: TTypography.h5.copyWith(
                        fontFamily: 'Lora',
                        color: TColorSystem.n400,
                      )),
                  ListingDistance(listing: listing),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 4),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ListingPrice(listing: listing),
            ),
          ],
        ),
      ],
    );
  }
}
