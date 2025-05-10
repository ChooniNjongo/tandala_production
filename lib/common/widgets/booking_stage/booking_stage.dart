import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/typography.dart';

class BookingStageIndicator extends StatelessWidget {
  final bool isAvailabilityStage;
  final bool isPaymentStage;
  final bool isCheckInStage;
  final bool isReviewStage;

  const BookingStageIndicator(
      {super.key,
      required this.isAvailabilityStage,
      required this.isPaymentStage,
      required this.isCheckInStage,
      required this.isReviewStage});

  @override
  Widget build(BuildContext context) {
    const indicatorWidth = 80.0;
    const indicatorHeight = 16.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Availability Stage Indicator
        Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
              width: indicatorWidth,
              height: indicatorHeight,
              decoration: BoxDecoration(
                color: isAvailabilityStage? Colors.greenAccent : TColors.secondaryBackground2,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  topRight: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
              ),
            ),
            const BookingStageTitle(title: "Availability",)
          ],
        ),

        /// Payment Stage Indicator
        Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
              width: indicatorWidth,
              height: indicatorHeight,
              decoration:  BoxDecoration(
                color:isPaymentStage? Colors.greenAccent : TColors.secondaryBackground2,
              ),
            ),
            const BookingStageTitle(title: "Payment",)
          ],
        ),

        /// CheckIn Stage Indicator
        Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
              width: indicatorWidth,
              height: indicatorHeight,
              decoration:  BoxDecoration(
                color:isCheckInStage? Colors.greenAccent : TColors.secondaryBackground2,
              ),
            ),

            const BookingStageTitle(title: "Check In",)
          ],
        ),

        /// Review Stage Indicator
        Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
              width: indicatorWidth,
              height: indicatorHeight,
              decoration: BoxDecoration(
                color: isAvailabilityStage? Colors.greenAccent : TColors.secondaryBackground2,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(0),
                  bottomLeft: Radius.circular(0),
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
            ),

            const BookingStageTitle(title: "Review",)
          ],
        ),
      ],
    );
  }
}


class BookingStageTitle extends StatelessWidget {
  final String title;

  const BookingStageTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,style:TTypography.label12Regular);
  }
}

