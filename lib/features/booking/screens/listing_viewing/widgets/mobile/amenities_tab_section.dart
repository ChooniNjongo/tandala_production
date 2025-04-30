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
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? TSizes.defaultSpace : 0,
          vertical: isMobile ? TSizes.defaultSpace : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height:
                isMobile ? TSizes.spaceBtwItems : TSizes.spaceBtwSections * 2,
          ),
          Text(
            "What this place offers",
            style: TTypography.h5.copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Row(
            children: [
              /// Right side amenities
              const Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TabAmenityTile(
                      svgIcon: TImages.kitchen, amenityTitle: 'Kitchen'),
                  TabAmenityTile(
                      svgIcon: TImages.swimming_active,
                      amenityTitle: 'Swimming pool'),
                ],
              )),

              /// Left side amenities
              const Expanded(
                  child: Column(
                children: [
                  TabAmenityTile(
                      svgIcon: TImages.parking, amenityTitle: 'Parking space'),
                  TabAmenityTile(
                      svgIcon: TImages.aircon,
                      amenityTitle: 'Air conditioning'),
                ],
              )),

              /// Expanded Widget to push them closer
              Visibility(
                  visible: !isMobile,
                  child: Expanded(flex: 3, child: Container()))
            ],
          ),
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
