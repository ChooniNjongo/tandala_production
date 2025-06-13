import 'package:flutter/material.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_strings.dart';
import 'bathroom_count.dart';
import 'bed_count.dart';
import 'bedroom_count.dart';
import 'filter_section_title.dart';

class ImportantCountsFilterSection extends StatelessWidget {
  const ImportantCountsFilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterSectionTitle(title: TTexts.counts),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        BathroomCountWidget(),
        SizedBox(height: 12),
        BedRoomCount(),
        SizedBox(height: 12),
        BedCount(),
      ],
    );
  }
}
