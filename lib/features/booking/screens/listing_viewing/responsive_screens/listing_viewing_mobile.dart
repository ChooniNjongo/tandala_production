import 'package:cwt_ecommerce_admin_panel/utils/constants/color_system.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../routes/routes.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/property/listing_model.dart';
import '../widgets/mobile/listing_image_section.dart';
import '../widgets/mobile/mobile_tab_view.dart';
import '../widgets/mobile/room_preview_card.dart';

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
            ListingImageSection(listing: listing, isEditing: isEditing),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: listing.propertyName,
                              style:
                                  TTypography.h4.copyWith(color: Colors.white),
                            ),
                            TextSpan(
                              text: "  ",
                              style: TTypography.body12Bold.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: TColorSystem.white,
                              ),
                            ),
                            TextSpan(
                                text: "${listing.city}.",
                                style: TTypography.body12Regular
                                    .copyWith(color: TColorSystem.n400)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "34 km away",
                    style: TTypography.body10Regular
                        .copyWith(color: TColorSystem.n600),
                  ),
                ],
              ),
            ),

            /// Listing Image Section with fixed height
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            const SizedBox(height: TSizes.spaceBtwItems),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: SvgPicture.asset(
                          "assets/icons/custom_icons/mage_message-round.svg",
                          height: 24,
                        ),
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      GestureDetector(
                        child: SvgPicture.asset(
                          "assets/icons/custom_icons/bitcoin-icons_share-outline.svg",
                          height: 24,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Text(
                    listing.summary,
                    style: TTypography.body12Regular
                        .copyWith(color: TColorSystem.n500),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const Text(
                    "Room Options",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 4,
                  ),
                  Text(
                    "5 booking options avaialble",
                    style: TTypography.body10Regular
                        .copyWith(color: TColorSystem.n400),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        listing.rooms.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                            right: index != listing.rooms.length - 1
                                ? TSizes.spaceBtwItems
                                : 0,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                TRoutes.roomViewing,
                                arguments: listing.rooms[index],
                              );
                            },
                            child: TRoomPreviewCard(room: listing.rooms[index]),
                          ),
                        ),
                      ),
                    ),
                  ),



                  /// Mobile Tab View - full bleed (no padding)
                  const SizedBox(height: TSizes.spaceBtwSections),
                  MobileTabView(
                    listing: listing,
                    isEditing: isEditing,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
