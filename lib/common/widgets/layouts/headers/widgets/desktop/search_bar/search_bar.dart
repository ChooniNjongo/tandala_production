import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/typography.dart';
import '../../../../../../../utils/device/device_utility.dart';

class TSearchBar extends StatelessWidget {
  const TSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return SizedBox(
      width: isMobile ? 264 : 326,
      height: 40,
      child: SearchBar(
        leading: SvgPicture.asset(
          "assets/icons/custom_icons/dark/search_dark.svg",
        ),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        hintText: 'Search for destinations like “lusaka”',
        hintStyle: WidgetStateProperty.all(TTypography.label12Regular.copyWith(
            color: const Color(
              0xFFC3C3C3,
            ),
            fontSize: 11,
            fontWeight: FontWeight.w400)),
        // Use the 'backgroundColor' property inside 'SearchBarThemeData'
        backgroundColor: WidgetStateProperty.all(TColors.searchFilterDark),
      ),
    );
  }
}
