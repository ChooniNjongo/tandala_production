import 'package:cwt_ecommerce_admin_panel/routes/routes.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/icons/table_action_icon_buttons.dart';
import '../../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/enums.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/category/city_or_town_controller.dart';

class CategoryRows extends DataTableSource {
  final controller = CityOrTownController.instance;

  @override
  DataRow? getRow(int index) {
    final category = controller.filteredItems[index];
    final parentCategory = controller.allItems.firstWhereOrNull((item) => item.id == category.parentId);
    return DataRow2(
      selected: controller.selectedRows[index],
      onSelectChanged: (value) => controller.selectedRows[index] = value ?? false,
      cells: [
        DataCell(
          Row(
            children: [
              TRoundedImage(
                width: 50,
                height: 50,
                padding: TSizes.sm,
                image: category.image,
                imageType: ImageType.network,
                borderRadius: TSizes.borderRadiusMd,
                backgroundColor: TColors.primaryBackground,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: Text(
                  category.name,
                  style: Theme.of(Get.context!).textTheme.bodyLarge!.apply(color: TColors.primary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        DataCell(Text(parentCategory != null ? parentCategory.name : '')),
        DataCell(category.isFeatured ? const Icon(Iconsax.heart5, color: TColors.primary) : const Icon(Iconsax.heart)),
        DataCell(Text(category.createdAt == null ? '' : category.formattedDate)),
        DataCell(
          TTableActionButtons(
            onEditPressed: () => Get.toNamed(TRoutes.editCategory, arguments: category),
            onDeletePressed: () => controller.confirmAndDeleteItem(category),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.filteredItems.length;

  @override
  int get selectedRowCount => controller.selectedRows.where((selected) => selected).length;
}
