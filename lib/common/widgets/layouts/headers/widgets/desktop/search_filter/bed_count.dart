import 'package:cwt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/desktop/search_filter/filter_section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../features/booking/controllers/base_counter_controller.dart';
import '../../../../../../../features/booking/controllers/search_filter_controller.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../chips/pill.dart';
import '../../../../../counter/counter.dart';
import 'filter_item.dart';

class BedCount extends StatelessWidget {
  const BedCount({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DefaultCounterController());
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TRoundedContainer(
            padding: EdgeInsets.only(right:16,top: 16,bottom: 16),
            child: FilterSectionSubtitle(subTitle: "Bed(s):")),
        CounterWidget(
          controller: controller,
        )
      ],
    );
  }
}
