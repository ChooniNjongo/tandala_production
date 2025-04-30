import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../features/booking/controllers/search_filter_controller.dart';
import '../../../../../../../utils/constants/color_system.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/text_strings.dart';
import '../../../../../../../utils/constants/typography.dart';
import 'filter_section_title.dart';

class ListingTypeFilter extends StatelessWidget {
  const ListingTypeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFilterController());
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FilterSectionTitle(title: TTexts.listingTypeCategory),
          TCheckboxItem(
            checkboxItem: TTexts.all,
            value: controller.isAllTypesSelected.value,
            onChanged: (value) {
              controller.resetAllListingTypeFilters();
              controller.isAllTypesSelected.value =
                  !controller.isAllTypesSelected.value;
              controller.searchWithFilters();
            },
            width: 240,
          ),
          TCheckboxItem(
            checkboxItem: TTexts.hotel,
            value: controller.isHotelSelected.value,
            onChanged: (value) {
              controller.resetAllTypesFilters();
              controller.isHotelSelected.value =
                  !controller.isHotelSelected.value;
              controller.searchWithFilters();
            },
            width: 240,
          ),
          TCheckboxItem(
            checkboxItem: TTexts.lodge,
            value: controller.isLodgeSelected.value,
            onChanged: (value) {
              controller.resetAllTypesFilters();
              controller.isLodgeSelected.value =
                  !controller.isLodgeSelected.value;
              controller.searchWithFilters();
            },
            width: 240,
          ),
          TCheckboxItem(
            checkboxItem: TTexts.guestHouse,
            value: controller.isGuestHouseSelected.value,
            onChanged: (value) {
              controller.resetAllTypesFilters();
              controller.isGuestHouseSelected.value =
                  !controller.isGuestHouseSelected.value;
              controller.searchWithFilters();
            },
            width: 240,
          ),
          TCheckboxItem(
            checkboxItem: TTexts.apartment,
            value: controller.isApartmentSelected.value,
            onChanged: (value) {
              controller.resetAllTypesFilters();
              controller.isApartmentSelected.value =
                  !controller.isApartmentSelected.value;
              controller.searchWithFilters();
            },
            width: 240,
          ),
        ],
      ),
    );
  }
}

class TCheckboxItem extends StatelessWidget {
  final double width;
  final String checkboxItem;
  final bool value;
  final void Function(bool?) onChanged;

  const TCheckboxItem(
      {super.key,
      required this.checkboxItem,
      required this.value,
      required this.onChanged,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            checkboxItem,
            style: TTypography.body14Regular
                .copyWith(color: value ? TColorSystem.n100 : TColorSystem.n600),
          ),
          Checkbox(
            activeColor: TColorSystem.primary500,
            checkColor: TColors.white,
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
