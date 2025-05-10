import 'package:cwt_ecommerce_admin_panel/features/booking/controllers/booking_controller.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/screens/bookings/widgets/mobile/bookings_rows.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/data_table/paginated_data_table.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../../shop/controllers/order/order_controller.dart';
import '../../../../../shop/screens/dashboard/table/table_source.dart';


class BookingsTable extends StatelessWidget {
  const BookingsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BookingController.instance;
    return Obx(
          () {
        // Orders & Selected Rows are Hidden => Just to update the UI => Obx => [ProductRows]
        Visibility(visible: false, child: Text(controller.filteredItems.length.toString()));
        Visibility(visible: false, child: Text(controller.selectedRows.length.toString()));

        // Table
        return TPaginatedDataTable(
          minWidth: 700,
          sortAscending: controller.sortAscending.value,
          sortColumnIndex: controller.sortColumnIndex.value,
          columns: [
            const DataColumn2(label: Text('Booking ID')),
            DataColumn2(label: const Text('Date'), onSort: (columnIndex, ascending) => controller.sortByDate(columnIndex, ascending)),
            const DataColumn2(label: Text('Place')),
            DataColumn2(label: const Text('Stage'), fixedWidth: TDeviceUtils.isMobileScreen(context) ? 120 : null),
            const DataColumn2(label: Text('Amount')),
          ],
          source: BookingsRows(),
        );
      },
    );
  }
}
