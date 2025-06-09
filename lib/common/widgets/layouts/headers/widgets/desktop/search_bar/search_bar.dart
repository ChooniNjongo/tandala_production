import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/image_strings.dart';
import '../../../../../../../utils/constants/typography.dart';
import '../../../../../../../utils/device/device_utility.dart';

class TSearchBar extends StatelessWidget {
  const TSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return SizedBox(
      width: 420,
      height: 46,
      child: SearchBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: SvgPicture.asset(
            TImages.search,
          ),
        ),

        shadowColor: WidgetStateProperty.all(Colors.transparent),
        hintText: 'Search Destination',
        hintStyle: WidgetStateProperty.all(TTypography.body16Regular.copyWith(
            color: const Color(
              0xFF888888,
            ),
            fontSize: 16,
            fontWeight: FontWeight.w500)),
        // Use the 'backgroundColor' property inside 'SearchBarThemeData'
        backgroundColor: WidgetStateProperty.all(TColors.searchFilterDark),
      ),
    );
  }
}
