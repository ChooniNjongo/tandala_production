import 'package:cwt_ecommerce_admin_panel/utils/constants/color_system.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/typography.dart';

class SectionHeader extends StatelessWidget {
  /// Title of the section.
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TTypography.body14Bold.copyWith(color: TColorSystem.n300),
    );
  }
}
