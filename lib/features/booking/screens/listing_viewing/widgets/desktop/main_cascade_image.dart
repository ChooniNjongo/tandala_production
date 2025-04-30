import 'package:flutter/material.dart';

import '../../../../../../utils/device/device_utility.dart';
import '../../../../../../utils/listing_data/listings_data.dart';
import 'cascade_image_card.dart';

class MainCascadeImage extends StatelessWidget {
  const MainCascadeImage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = TDeviceUtils.getScreenHeight();
    final screenWidth = TDeviceUtils.getScreenWidth(context);
    return CascadeImageCard(
        topLeftRadius: 12,
        bottomLeftRadius: 12,
        width: screenWidth * 0.3,
        height: screenHeight * 0.58,
        image: TTestListings.properties[0].propertyImages[0]);
  }
}
