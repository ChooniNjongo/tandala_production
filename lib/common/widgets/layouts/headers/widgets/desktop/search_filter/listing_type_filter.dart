import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../features/booking/controllers/search_filter_controller.dart';
import '../../../../../../../utils/constants/color_system.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/text_strings.dart';
import '../../../../../../../utils/constants/typography.dart';
import '../../../../../chips/pill.dart';
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
          const SizedBox(height: 16,),
          Wrap(
            spacing: 12, // Horizontal spacing between chips
            runSpacing: 12, // Vertical spacing between rows when chips wrap
            children: [
              TPill(
                  title: TTexts.all,
                  isSelected: controller.isPriceHighToLowSelected.value,
                  onTap: controller.onIsPriceHighToLowTapped,count: 6,),
              TPill(
                  title: TTexts.hotel,
                  isSelected: controller.isPriceLowToHighSelected.value,
                  onTap: controller.onIsPriceLowToHighTapped,count: 63,),
              TPill(
                  title: TTexts.lodge,
                  isSelected: controller.isDiscountSelected.value,
                  onTap: controller.onIsDiscountSelectedTapped,count: 6),
              TPill(
                  title: TTexts.guestHouse,
                  isSelected: controller.isDiscountSelected.value,
                  onTap: controller.onIsDiscountSelectedTapped,count: 23),
              TPill(
                  title: TTexts.apartment,
                  isSelected: controller.isDiscountSelected.value,
                  onTap: controller.onIsDiscountSelectedTapped,count: 33),

            ],
          ),
        ],
      ),
    );
  }
}

/*class TCheckboxItem extends StatelessWidget {
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
                .copyWith(color: value ? TColorSystem.primary300 : TColors.textPrimary),
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
}*/
