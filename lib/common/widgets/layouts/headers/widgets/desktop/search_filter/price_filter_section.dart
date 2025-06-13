import 'package:cwt_ecommerce_admin_panel/common/widgets/chips/pill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../../features/booking/controllers/search_filter_controller.dart';
import '../../../../../../../features/booking/screens/home/widgets/common/price_range_slider.dart';
import '../../../../../../../utils/constants/color_system.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/image_strings.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_strings.dart';
import '../../../../../../../utils/constants/typography.dart';
import 'filter_section_title.dart';

class PriceFilterSection extends StatelessWidget {
  const PriceFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFilterController());
    return const TRoundedContainer(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterSectionTitle(title: TTexts.priceFilter),
          SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          FilterSectionSubtitle(subTitle: TTexts.priceRangeSubtitle),
          PriceSlider(),
          SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TPill(title: "\$400", isSelected: false),
              TPill(title: "\$2400", isSelected: false)
            ],
          ),
        ],
      ),
    );
  }
}
