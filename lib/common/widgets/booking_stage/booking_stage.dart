import 'package:flutter/material.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/typography.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/color_system.dart';

class BookingStageIndicator extends StatelessWidget {
  final bool isAvailabilityStage;
  final bool isPaymentStage;
  final bool isCheckInStage;
  final bool isReviewStage;

  const BookingStageIndicator({
    super.key,
    required this.isAvailabilityStage,
    required this.isPaymentStage,
    required this.isCheckInStage,
    required this.isReviewStage,
  });

  @override
  Widget build(BuildContext context) {
    const indicatorWidth = 80.0;
    const indicatorHeight = 16.0;

    return SizedBox(
      height: 96,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: TSizes.defaultSpaceDesktop),
            child: Row(
              children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Iconsax.arrow_left,
                      color: TColorSystem.n100,
                    )),
              ],
            ),
          ),

          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Availability Stage
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    width: indicatorWidth,
                    height: indicatorHeight,
                    decoration: BoxDecoration(
                      color: isAvailabilityStage || isPaymentStage || isCheckInStage || isReviewStage
                          ? Colors.greenAccent
                          : TColorSystem.n600,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                  ),
                  BookingStageTitle(
                    title: "Availability",
                    isCurrentStage: isAvailabilityStage,
                  ),
                ],
              ),

              /// Payment Stage
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    width: indicatorWidth,
                    height: indicatorHeight,
                    decoration: BoxDecoration(
                      color:   isPaymentStage  || isCheckInStage || isReviewStage
                          ? Colors.greenAccent
                          : TColorSystem.n600
                    ),
                  ),
                  BookingStageTitle(
                    title: "Payment",
                    isCurrentStage: isPaymentStage,
                  ),
                ],
              ),

              /// Check-In Stage
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    width: indicatorWidth,
                    height: indicatorHeight,
                    decoration: BoxDecoration(
                      color: isCheckInStage || isReviewStage
                          ? Colors.greenAccent
                          : TColorSystem.n600,
                    ),
                  ),
                  BookingStageTitle(
                    title: "Check In",
                    isCurrentStage: isCheckInStage,
                  ),
                ],
              ),

              /// Review Stage
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    width: indicatorWidth,
                    height: indicatorHeight,
                    decoration: BoxDecoration(
                      color: isReviewStage
                          ? Colors.greenAccent
                          : TColorSystem.n600,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ),
                  BookingStageTitle(
                    title: "Review",
                    isCurrentStage: isReviewStage,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BookingStageTitle extends StatelessWidget {
  final String title;
  final bool isCurrentStage;

  const BookingStageTitle({
    super.key,
    required this.title,
    required this.isCurrentStage,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TTypography.label12Regular.copyWith(
        color: isCurrentStage ? Colors.white : TColorSystem.n600,
      ),
    );
  }
}
