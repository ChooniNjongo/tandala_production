import 'package:cwt_ecommerce_admin_panel/features/booking/controllers/booking_controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../../../../common/widgets/data_table/paginated_data_table.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../../../utils/device/device_utility.dart';
import 'bookings_rows.dart';

class BookingsTable extends StatelessWidget {
  const BookingsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BookingController.instance;

    // Table
    return TPaginatedDataTable(
      tableHeight:480,
      minWidth: 400,
      sortAscending: controller.sortAscending.value,
      sortColumnIndex: controller.sortColumnIndex.value,
      columns: [
       // const DataColumn2(label: Text('Booking ID')),
        DataColumn2(
            label:  const Text('Date',style: TTypography.body10Regular,),
            onSort: (columnIndex, ascending) =>
                controller.sortByDate(columnIndex, ascending)),
        const DataColumn2(label: Text('Place',style: TTypography.body10Regular)),
        DataColumn2(
            label:  const Text('Stage',style: TTypography.body10Regular),
            fixedWidth: TDeviceUtils.isMobileScreen(context) ? 120 : null),
        const DataColumn2(label: Text('Amount',style: TTypography.body10Regular)),
      ],
      source: BookingsRows(),
    );
  }
}
