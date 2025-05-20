import 'package:cwt_ecommerce_admin_panel/utils/constants/color_system.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/cards/property_cards/mobile/widgets/listing_distance.dart';
import '../../../../../routes/routes.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/property/listing_model.dart';
import '../widgets/common/listing_name_location.dart';
import '../widgets/mobile/amenities_tab_section.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),

              const SizedBox(
                height: 8,
              ),
              Row(


                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textAlign:TextAlign.start,
                    listing.propertyName,
                    style: TTypography.body16Bold.copyWith(
                      fontWeight: FontWeight.w700,
                      color: TColorSystem.white,
                    ),
                  ),

                  Row(
                    children: [
                      const Text("Share",style: TTypography.body10Regular,),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.share,color: TColorSystem.n100,)),
                    ],
                  ),

                ],
              ),

              /// Listing Image Section with fixed height
              ListingImageSection(listing: listing, isEditing: isEditing),

              const SizedBox(
                height: TSizes.spaceBtwSections / 4,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        ListingNameLocation(listing: listing),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        ListingDistance(listing: listing),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        Text(
                          listing.summary,
                          textAlign: TextAlign.start,
                          style: TTypography.body10Regular.copyWith(color: TColorSystem.n500),
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections * 2),
                        AmenitiesTabSection(isEditing: isEditing,),
                      ],
                    ),
                  )),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Booking options",style: TTypography.body10Regular,),
                              ],
                            ),
                            const SizedBox(height: TSizes.spaceBtwItems,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: List.generate(
                                listing.rooms.length,
                                (index) => Padding(
                                  padding: EdgeInsets.only(
                                    bottom: index != listing.rooms.length - 1
                                        ? TSizes.spaceBtwItems - 8
                                        : 0,
                                  ),
                                  child: GestureDetector(
                                      onTap: (){ Get.toNamed(TRoutes.roomViewing,arguments: listing.rooms[index]);},
                                      child: TRoomPreviewCard(room: listing.rooms[index])),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
      ),
    );
  }
}


