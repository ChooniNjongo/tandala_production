import 'package:flutter/material.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../common/widgets/shimmers/shimmer.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/device/device_utility.dart';

class QuickFiltersShimmer extends StatelessWidget {
  const QuickFiltersShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: TRoundedContainer(
          radius: 4,
          margin: EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              QuickFilterItemShimmer(),
              QuickFilterItemShimmer(),
              QuickFilterItemShimmer(),
              QuickFilterItemShimmer(),
              QuickFilterItemShimmer(),
              QuickFilterItemShimmer(),
              QuickFilterItemShimmer(),
              QuickFilterItemShimmer(),
            ],
          )),
    );
  }
}

class QuickFilterItemShimmer extends StatelessWidget {
  const QuickFilterItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return TRoundedContainer(
      child: Column(
        children: [
          TShimmerEffect(
            radius: isMobile ? 40 : 50,
            height: isMobile ? 24 : 32,
            width: isMobile ? 24 : 32,
          ),
          SizedBox(
            height: isMobile ? TSizes.spaceBtwItems / 2 : TSizes.spaceBtwItems,
          ),
          TShimmerEffect(
            height: isMobile ? 7 : 10,
            width: isMobile ? 40 : 56,
          ),
        ],
      ),
    );
  }
}
