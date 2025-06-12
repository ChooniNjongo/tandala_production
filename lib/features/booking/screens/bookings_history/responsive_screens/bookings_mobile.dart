import 'package:flutter/material.dart';
import '../../../../../utils/constants/color_system.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/typography.dart';
import '../widgets/mobile/bookings_table.dart';

class BookingsHistoryMobile extends StatelessWidget {
  const BookingsHistoryMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpaceDesktop),
              child: Column(
                children: [
                  /// Label
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Bookings History",
                        style: TTypography.h3.copyWith(
                          color: TColorSystem.n200, // Text color from theme
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "View your booking history",
                        style: TTypography.body10Regular
                            .copyWith(color: TColorSystem.n500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Tap to view details",
                            style: TTypography.body10Regular
                                .copyWith(color: TColorSystem.n500),
                          ),
                          const SizedBox(width: 4,),
                          const Icon(Icons.touch_app_rounded,color: TColorSystem.n500,)
                        ],
                      ),
                    ],
                  )

/*                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TTexts.bookingTableInstruction1,
                        softWrap: true,
                        style: TTypography.label12Regular,
                      ),
                      Icon(
                        Icons.arrow_right_alt_rounded,
                        color: TColors.iconPrimary,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        TTexts.bookingTableInstruction2,
                        style: TTypography.label12Regular,
                      ),
                      Icon(
                        Icons.touch_app_rounded,
                        color: TColors.iconPrimary,
                      )
                    ],
                  ),*/
                ],
              ),
            ),
            const BookingsTable(),
          ],
        ),
      ),
    );
  }
}
