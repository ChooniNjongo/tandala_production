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
    return  const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterSectionTitle(title: TTexts.counts),
        SizedBox(height: TSizes.spaceBtwSections,),
        BathRoomCount(propertyFeature: 'Bathrooms'),
        SizedBox(height: TSizes.spaceBtwSections),
        BedRoomCount(propertyFeature: 'Bedrooms'),
        SizedBox(height: TSizes.spaceBtwSections),
        BedCount(propertyFeature: 'Beds'),
        SizedBox(height: TSizes.spaceBtwSections,),
      ],
    );
  }
}
