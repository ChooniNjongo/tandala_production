// File: lib/features/search/widgets/filter_overlay_header.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';

class FilterOverlayHeader extends StatelessWidget {
  final VoidCallback onClose;

  const FilterOverlayHeader({
    super.key,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onClose,
          child: SvgPicture.asset(TImages.filterCloseSvg),
        ),
        const Text(
          'Filters',
          style: TextStyle(
            fontFamily: 'InterDisplay',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: TColors.textPrimary,
          )
        ),
        const Icon(
          Icons.close,
          color: Colors.transparent,
          size: 20,
        ),
      ],
    );
  }
}