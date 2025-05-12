import 'package:cwt_ecommerce_admin_panel/features/booking/screens/room_viewing/widgets/mobile/room_viewing_image_card.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/color_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../models/property/room.dart';
import '../../../listing_viewing/widgets/common/tab_amentity_tile.dart';

class RoomViewingBody extends StatelessWidget {
  const RoomViewingBody({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Room pictures
          GestureDetector(
              onTap: () {
                Get.toNamed(TRoutes.roomPhotoGallery, arguments: room);
              },
              child: RoomViewingImageCard(room: room)),

          /// Room Name
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  room.roomDescription,
                  style: TTypography.label16Bold.copyWith(color: Colors.white),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  // Create a property called Room summary
                  "This is room is an quite save if you looking to combine style and affordability. We believe you will enjoy your stay.",
                  style: TTypography.body12Regular
                      .copyWith(color: TColorSystem.n400),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                Text(
                  "What this room has to offer",
                  style: TTypography.label14Bold.copyWith(color: TColorSystem.n300),
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Row(
                  children: [
                    /// Right side amenities
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TabAmenityTile(
                            svgIcon: TImages.wifi, amenityTitle: 'Wifi'),
                        TabAmenityTile(
                            svgIcon: TImages.aircon,
                            amenityTitle: 'Air conditioning'),
                      ],
                    )),

                    /// Left side amenities
                    Expanded(
                        child: Column(
                      children: [
                        TabAmenityTile(
                            svgIcon: TImages.refrigerator,
                            amenityTitle: 'Refrigerator'),
                        TabAmenityTile(
                            svgIcon: TImages.smoking, amenityTitle: 'Smoking'),
                      ],
                    )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
