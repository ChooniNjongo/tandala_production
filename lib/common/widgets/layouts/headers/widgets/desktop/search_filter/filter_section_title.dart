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
      style: TTypography.h4.copyWith(color: TColors.white),
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
      style: TTypography.body12Regular.copyWith(color: TColorSystem.n600),
    );
  }
}
