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
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Property Name and city
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: TColors.secondaryBackground2,
                      borderRadius:
                          BorderRadius.circular(TSizes.borderRadiusSm),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: RichText(
                        text: TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: listing.propertyName,
                              style: TTypography.body12Bold.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: TColors.textOnSecondaryBackground2,
                              ),
                            ),
                            TextSpan(
                              text: "   ",
                              style: TTypography.body12Bold.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: TColorSystem.white,
                              ),
                            ),
                            TextSpan(
                              text: listing.city,
                              style: TTypography.body12Bold.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: TColorSystem.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// Rating
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: true,
                        child: Icon(
                          Iconsax.star4,
                          color: TColors.textSecondary,
                          size: 10,
                        ),
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems / 4),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: listing.rating.toString(),
                              style: TTypography.label12Bold.copyWith(
                                fontSize: 10,
                                color: TColors.textSecondary,
                              ),
                            ),
                            //   TextSpan(text: property.rating.toString() != 0.0.toString() ? property.rating.toString(): "",style: Theme.of(context).textTheme.labelMedium)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwItems / 2),

              /// Distance from user
              if (listing.distanceFromUser != null)
                Text(
                  '${listing.distanceFromUser!.round()} Kilometers away',
                  style: TTypography.body12Regular.copyWith(
                    fontSize: 10,
                    color: TColors.textSecondary,
                  ),
                ),

              if (listing.distanceFromUser == null)
                GestureDetector(
                  onTap: () async {
                    await locationController.getLocation();
                    listingsController.searchListings();
                  },
                  child: Text(
                    'See distance',
                    style: TTypography.body12Regular.copyWith(
                      fontSize: 10,
                      color: TColors.textSecondary,
                    ),
                  ),
                ),

              /// Price and Rating
              RichText(
                text: TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Starting at',
                      style: TTypography.body12Regular.copyWith(
                        fontSize: 10,
                        color: TColors.textSecondary,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' K${listing.startingRoomPrice.toInt().toString()} ',
                      style: TTypography.h5.copyWith(
                        fontSize: 10,
                        color: TColors.textSecondary,
                      ),
                    ),
                    TextSpan(
                      text: 'night',
                      style: TTypography.body12Regular.copyWith(
                        fontSize: 10,
                        color: TColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
