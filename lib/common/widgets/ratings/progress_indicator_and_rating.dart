import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/typography.dart';

class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Text(
                text,
                style: TTypography.label12Regular,
              )),
          const SizedBox(width: TSizes.spaceBtwItems,),
          Expanded(
            flex: 11,
            child: SizedBox(
              width: TDeviceUtils.getScreenWidth(context) * 0.1,
              child: LinearProgressIndicator(
                value: value,
                minHeight: 4,
                backgroundColor: TColors.grey,
                valueColor:
                    AlwaysStoppedAnimation(TColors.primary500.withOpacity(1)),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
