import 'package:cwt_ecommerce_admin_panel/common/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            TShimmerEffect(
              height: MediaQuery.of(context).size.height * .30,
              width:
                  isMobile
                      ? double.infinity
                      : THelperFunctions.screenWidth() * .86,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Property Name Shimmer and  City Shimmer
            const TShimmerEffect(width: 110, height: 16, radius: 4),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// Distance Shimmer
            const TShimmerEffect(width: 110, height: 16, radius: 4),
          ],
        ),
      ),
    );
  }
}
