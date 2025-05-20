import 'package:flutter/material.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../../../utils/device/device_utility.dart';

class HeroText extends StatelessWidget {
  const HeroText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return TRoundedContainer(
      width: double.infinity,
      radius: 0,
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Find the best Zambia has in ",
                  style: TTypography.h3.copyWith(
                      color: TColors.white, fontSize: isMobile ? 16 : 24),
                ),
                TextSpan(
                  text: "hotels, ",
                  style: TTypography.h3.copyWith(
                      color: const Color(0xFF7FC5F6),
                      fontSize: isMobile ? 16 : 24),
                ),
              ],
            ),
          ),

          ///
          ///
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "apartments, ",
                  style: TTypography.h3.copyWith(
                      color: const Color(0xFFDA8787),
                      fontSize: isMobile ? 16 : 24),
                ),
                TextSpan(
                  text: "lodges, ",
                  style: TTypography.h3.copyWith(
                      color: const Color(0xFFB1B1B1),
                      fontSize: isMobile ? 16 : 24),
                ),
                TextSpan(
                  text: "and more",
                  style: TTypography.h3.copyWith(
                    color: TColors.white,
                    fontSize: isMobile ? 16 : 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
