import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../common/widgets/layouts/headers/widgets/desktop/search_bar/search_bar.dart';
import '../../../../../../utils/constants/image_strings.dart';

class TSearchAndFilters extends StatelessWidget {
  const TSearchAndFilters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TSearchBar(),
        Row(
          children: [
            const SizedBox(width: 8),
            Container(
              width: 46,
              height: 46,
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color:
                    const Color(0xFF1A2323), // or any desired background color
              ),
              child: SvgPicture.asset(TImages.quickFilter),
            ),
            const SizedBox(width: 8),
            Container(
              width: 46,
              height: 46,
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: const Color(0xFF1A2323), // or any desired background color
              ),
              child: SvgPicture.asset(TImages.filters),
            ),
          ],
        ),
      ],
    );
  }
}
