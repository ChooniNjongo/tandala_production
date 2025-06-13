import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/color_system.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/typography.dart';

class FilterSectionTitle extends StatelessWidget {
  final String title;

  const FilterSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: 'InterDisplay',
        fontWeight: FontWeight.w500,
        fontSize: 15,
        height: 1.4, // 140% line height
        letterSpacing: 0,
        color: TColors.white,
      ),
    );
  }
}

class FilterSectionSubtitle extends StatelessWidget {
  final String subTitle;

  const FilterSectionSubtitle({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: const TextStyle(
        fontFamily: 'InterDisplay',
        fontWeight: FontWeight.w400,
        fontSize: 13,
        height: 1.3, // 130% line height
        letterSpacing: 0,
        color: Color(0xFF888888),
      ),
    );
  }
}
