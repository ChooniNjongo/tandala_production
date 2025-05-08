import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../../features/booking/controllers/search_filter_controller.dart';
import '../../../../../../../utils/constants/image_strings.dart';
import '../../../../../../../utils/constants/typography.dart';
import '../../../../../../../utils/device/device_utility.dart';

class SearchFilterHeader extends StatelessWidget {
  const SearchFilterHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFilterController());
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Chat gtp how do I make the dialog close when I click on this icon button..
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(Get.context!);
                  },
                  icon: SvgPicture.asset(TImages.filterCloseIcon)),
            ),
            Text(
              title,
              style: isMobile
                  ? TTypography.h3.copyWith(color: Colors.white)
                  : TTypography.h3.copyWith(color: Colors.white),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.close,
                  color: Colors.transparent,
                )),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 0.4,
          width: double.infinity,
          color: const Color(0xFF404747),
        ),
      ],
    );
  }
}
