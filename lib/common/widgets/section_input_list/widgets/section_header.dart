import 'package:flutter/material.dart';

import '../../../../utils/constants/typography.dart';


class SectionHeader extends StatelessWidget {
  /// Title of the section.
  final String title;


  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return          Text(
      title,
      style: TTypography.h4.copyWith(color: Colors.white),
    );
  }
}
