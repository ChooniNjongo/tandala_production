// File: lib/features/search/widgets/filter_button.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';

class FilterButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FilterButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 46,
        height: 46,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: TColors.filterButtonBackground,
        ),
        child: SvgPicture.asset(TImages.filters),
      ),
    );
  }
}