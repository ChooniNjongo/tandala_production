import 'package:cwt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/desktop/search_filter/filter_section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../features/booking/controllers/search_filter_controller.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../chips/pill.dart';
import 'filter_item.dart';

class BedRoomCount extends StatelessWidget {
  const BedRoomCount({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFilterController());
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TRoundedContainer(
            padding: EdgeInsets.only(right:16,top: 16,bottom: 16),
            child: FilterSectionSubtitle(subTitle: "Bedroom(s):")),
        const SizedBox(
          height: 16,
        ),
        Obx(
          () => Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              TPill(
                title: 'Any',
                isSelected: controller.anyBedroomCountSelected.value,
                onTap: controller.onAnyBedroomCountSelected,
              ),
              TPill(
                title: '1',
                isSelected: controller.oneBedroomCountSelected.value,
                onTap: controller.onOneBedroomCountSelected,
              ),
              TPill(
                title: '2',
                isSelected: controller.twoBedroomCountSelected.value,
                onTap: controller.onTwoBedroomCountSelected,
              ),
              TPill(
                title: '3 or More',
                isSelected: controller.threeBedroomCountSelected.value,
                onTap: controller.onThreeBedroomCountSelected,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
