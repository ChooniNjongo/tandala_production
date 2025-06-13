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
    return TRoundedContainer(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FilterSectionTitle(title: TTexts.priceFilter),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Obx(
            () => Text(
                "ZMK${controller.currentRange.value.start.round()} - ZMK${controller.currentRange.value.end.round()}",
                style: TTypography.body12Regular.copyWith(color: TColorSystem.n500)),
          ),
          Stack(
            children: [
              TRoundedContainer(
                  child: SvgPicture.asset(TImages.filterCloseSvg),
              ),
              const Positioned(left: -5, bottom: -5, child: PriceSlider()),
            ],
          ),
          Text("The average amount of money spent is ZMK250",
              style:
                  TTypography.body12Regular.copyWith(color: TColors.textPrimary)),
        ],
      ),
    );
  }
}
