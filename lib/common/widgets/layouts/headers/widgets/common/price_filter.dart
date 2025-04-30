import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../features/booking/controllers/search_filter_controller.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../../../containers/rounded_container.dart';
import 'price_range_slider.dart';

class PriceFilter extends StatelessWidget {
  const PriceFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFilterController());
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      child: Column(
        children: [
          Text(
            "Price Range",
            style: TTypography.h5
                .copyWith(color: TColors.white ),
          ),
          Obx(
            () => Text(
                "ZMK${controller.currentRange.value.start.round()} - ZMK${controller.currentRange.value.end.round()}",
                style: TTypography.body12Regular.copyWith(
                    color: dark ? TColors.textSecondaryDark : TColors.textSecondaryDark)),
          ),
          Stack(
            children: [
              TRoundedContainer(
                child: SvgPicture.asset(
                    "assets/images/price_filter/price_filter.svg",
                    height: 44,
                    semanticsLabel: 'Logo'),
              ),
              const Positioned(left: -5, bottom: -5, child: PriceSlider()),
            ],
          ),
          Text("The average amount of money spent is ZMK250",
              style: TTypography.body12Regular.copyWith(
                  color: dark ? TColors.textSecondaryDark : TColors.textSecondaryDark)),
        ],
      ),
    );
  }
}
