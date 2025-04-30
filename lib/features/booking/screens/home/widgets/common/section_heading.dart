import 'package:flutter/material.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../../../utils/device/device_utility.dart';

class SectionHeading extends StatelessWidget {
  final String title;
  final String subtitle;
  final String headingAction;
  final bool useHeadingAction;

  const SectionHeading({
    super.key,
    required this.title,
    required this.subtitle,
    required this.headingAction,  this.useHeadingAction = true,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TTypography.h4
                .copyWith(fontSize: isMobile ? 13 : 16, color: TColors.white),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // This ensures spacing between subtitle and headingAction
            children: [
              Flexible(
                child: Text(
                  subtitle,
                  style: TTypography.body12Regular.copyWith(
                    fontSize: isMobile ? 10 : 12,
                    color: TColors.textSecondary,
                  ),
                ),
              ),
              Visibility(
                visible: !isMobile,
                child: Row(
                  children: [
                    Text(
                      headingAction,
                      style: TTypography.body14Bold.copyWith(
                        fontSize: 14,
                        color: TColors.primary500,
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: TColors.primary500,
                    )
                  ],
                ),
              ),
            ],
          ),
          Visibility(
            visible: isMobile && useHeadingAction,
            child: Row(
              children: [
                Text(
                  headingAction,
                  style: TTypography.body14Bold.copyWith(
                    fontSize: 10,
                    color: TColors.primary500,
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: TColors.primary500,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
