import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/constants/typography.dart';
import '../widgets/mobile/bookings_table.dart';

class BookingsMobileScreen extends StatelessWidget {
  const BookingsMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TBreadcrumbsWithHeading(
                      heading: 'Bookings', breadcrumbItems: ['Bookings']),
                  SizedBox(height: TSizes.spaceBtwSections),
                  Column(
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
                  SizedBox(height: TSizes.spaceBtwItems),
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
                  ),
                ],
              ),
            ),
            BookingsTable(),
          ],
        ),
      ),
    );
  }
}
