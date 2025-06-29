import 'package:cwt_ecommerce_admin_panel/utils/constants/color_system.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../loaders/animation_loader.dart';

/// Custom PaginatedDataTable widget with additional features
class TPaginatedDataTable extends StatelessWidget {
  const TPaginatedDataTable({
    super.key,
    required this.columns,
    required this.source,
    this.rowsPerPage = 10,
    this.tableHeight = 760,
    this.onPageChanged,
    this.sortColumnIndex,
    this.dataRowHeight = TSizes.md * 2,
    this.sortAscending = true,
    this.minWidth = 1000,
  });

  /// Whether to sort the DataTable in ascending or descending order.
  final bool sortAscending;

  /// Index of the column to sort by.
  final int? sortColumnIndex;

  /// Number of rows to display per page.
  final int rowsPerPage;

  /// Data source for the DataTable.
  final DataTableSource source;

  /// List of columns for the DataTable.
  final List<DataColumn> columns;

  /// Callback function to handle page changes.
  final Function(int)? onPageChanged;

  /// Height of each data row in the DataTable.
  final double dataRowHeight;

  /// Height of the entire DataTable.
  final double tableHeight;

  /// Minimum Width of the entire DataTable.
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tableHeight,
      child: Theme(
        data: Theme.of(context).copyWith(
          cardTheme: const CardTheme(
            color: TColors.primaryBackground,
            elevation: 2,
          ),
          iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(
              foregroundColor: TColorSystem.n300,
            ),
          ),
        ),
        child: PaginatedDataTable2(
          source: source,

          /// COLUMNS & ROWS
          columns: columns,
          columnSpacing: 4,
          minWidth: minWidth,
          dividerThickness: 0,
          horizontalMargin: 4,
          rowsPerPage: rowsPerPage,
          dataRowHeight: dataRowHeight,

          /// CHECKBOX
          showCheckboxColumn: true,

          /// PAGINATION
          showFirstLastButtons: true,
          onPageChanged: onPageChanged,
          renderEmptyRowsInTheEnd: false,
          onRowsPerPageChanged: (noOfRows) {},

          /// HEADER DESIGN
          headingTextStyle: Theme.of(context).textTheme.titleMedium,
          headingRowColor: WidgetStateProperty.resolveWith(
                  (states) => TColors.secondaryBackground),
          headingRowDecoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
            ),
          ),
          empty: const TAnimationLoaderWidget(
            animation: TImages.tableIllustration,
            text: 'Nothing Found',
            height: 200,
            width: 200,
          ),

          /// SORTING
          sortAscending: sortAscending,
          sortColumnIndex: sortColumnIndex,
          sortArrowBuilder: (bool ascending, bool sorted) {
            if (sorted) {
              return Icon(
                ascending ? Iconsax.arrow_up_3 : Iconsax.arrow_down,
                size: TSizes.iconSm,
              );
            } else {
              return const Icon(Iconsax.arrow_3, size: TSizes.iconSm);
            }
          },
        ),
      ),
    );
  }
}
