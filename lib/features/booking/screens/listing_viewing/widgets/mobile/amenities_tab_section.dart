import 'package:cwt_ecommerce_admin_panel/utils/constants/color_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../common/edit.dart';
import '../common/tab_amentity_tile.dart';

class AmenitiesTabSection extends StatelessWidget {
  const AmenitiesTabSection({super.key, required this.isEditing});

  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return Padding(
      padding: const EdgeInsets.all( TSizes.defaultSpaceDesktop),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height:
                isMobile ? TSizes.spaceBtwItems : TSizes.spaceBtwSections * 4,
          ),
          Text(
            "What this place offers",
            style: TTypography.body12Regular.copyWith(color: TColorSystem.n500),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems/ 2,
          ),
          const TabAmenityTile(
              svgIcon: TImages.kitchen, amenityTitle: 'Kitchen'),
          const TabAmenityTile(
              svgIcon: TImages.swim,
              amenityTitle: 'Swimming pool'),

          /// Left side amenities
          const TabAmenityTile(
              svgIcon: TImages.parking, amenityTitle: 'Parking space'),
          const TabAmenityTile(
              svgIcon: TImages.aircon,
              amenityTitle: 'Air conditioning'),

          /// Expanded Widget to push them closer
          Visibility(
              visible: !isMobile,
              child: Expanded(flex: 3, child: Container())),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          if (isEditing)
            Edit(
              label: 'edit amenities',
              onTap: () {
                Get.toNamed(TRoutes.amenities);
              },
            )
        ],
      ),
    );
  }
}
