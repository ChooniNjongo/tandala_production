import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../common/edit.dart';

class MapTabSection extends StatelessWidget {
  const MapTabSection({super.key, required this.isEditing});

  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: isMobile ? TSizes.defaultSpace : 0,
            vertical:
                isMobile ? TSizes.defaultSpace : TSizes.spaceBtwSections * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Where you'll be",
                style: TTypography.h5.copyWith(fontSize: 18)),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text("Location will be revealed after booking.",
                style: TTypography.label12Regular.copyWith(fontSize: 11)),

            const SizedBox(height: TSizes.spaceBtwItems,),
            if(isEditing)
             Edit(label: 'update location',                        onTap: () {
              Get.toNamed(TRoutes.location);
            },),

            Stack(
              children: [
                TRoundedContainer(
                    child: SvgPicture.asset(
                  TImages.map,
                  semanticsLabel: 'Map',
                  color: Colors.white,
                  height: 300,
                  width: 60,
                )),
                Positioned(
                    bottom: 150,
                    right: 150,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          TImages.googleMaps,
                          semanticsLabel: 'Google Maps',
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
