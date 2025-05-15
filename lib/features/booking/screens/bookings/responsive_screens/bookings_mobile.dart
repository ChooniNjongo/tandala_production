import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../shop/screens/dashboard/widgets/dashboard_card.dart';
import '../widgets/mobile/bookings_summary.dart';
import '../widgets/mobile/bookings_table.dart';

class BookingsMobileScreen extends StatelessWidget {
  const BookingsMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
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
                  BookingsSummary(),
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
            BookingsTable(),
          ],
        ),
      ),
    );
  }
}
