import 'package:cwt_ecommerce_admin_panel/features/booking/controllers/booking_controller.dart';
import 'package:cwt_ecommerce_admin_panel/routes/routes.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/typography.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../utils/constants/colors.dart';

class BookingsRows extends DataTableSource {
  final controller = BookingController.instance;

  @override
  DataRow? getRow(int index) {
    final booking = controller.userBookings[index];
    return DataRow2(
      onTap: () => Get.toNamed(TRoutes.bookingRoom, arguments: booking),
      selected: controller.selectedRows[index],
      onSelectChanged: (value) =>
          controller.selectedRows[index] = value ?? false,
      cells: [
/*        DataCell(
          Text(
            booking.bookingId.substring(0,6),
            style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(
                color:
                    booking.isComplete ? TColors.darkerGrey : TColors.primary),
          ),
        ),*/
        DataCell(Text(
          booking.formattedBookingDate,
          style: TTypography.label12Regular.copyWith(
              color: booking.isComplete ? TColors.darkerGrey : TColors.primary),
        )),
        DataCell(Text(booking.listing.propertyName,
            style: TTypography.label12Regular.copyWith(
                color: booking.isComplete
                    ? TColors.darkerGrey
                    : TColors.primary))),
        DataCell(Text(booking.bookingStage.name,
            style: TTypography.label12Regular.copyWith(
                color: booking.isComplete
                    ? TColors.darkerGrey
                    : TColors.primary))),
        DataCell(Text('K${booking.bookingAmountTotal.round()}',
            style: TTypography.label12Regular.copyWith(
                color: booking.isComplete
                    ? TColors.darkerGrey
                    : TColors.primary))),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.filteredItems.length;

  @override
  int get selectedRowCount =>
      controller.selectedRows.where((selected) => selected).length;
}
