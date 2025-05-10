import 'package:flutter/material.dart';
import '../../../../../common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../shop/screens/order/all_orders/table/data_table.dart';

class BookingsMobileScreen extends StatelessWidget {
  const BookingsMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBreadcrumbsWithHeading(heading: 'Bookings', breadcrumbItems: ['Bookings']),
              SizedBox(height: TSizes.spaceBtwSections),
              OrderTable(),
            ],
          ),
        ),
      ),
    );
  }
}
