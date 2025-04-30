import 'package:flutter/material.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_strings.dart';
import '../../../../../drop_down_button2/drop_down_2_searchable.dart';
import 'filter_section_title.dart';

class LocationFilter extends StatelessWidget {
  const LocationFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: TSizes.spaceBtwSections,),
        FilterSectionTitle(title: TTexts.location),
        SizedBox(height: TSizes.spaceBtwItems,),
        FilterSectionSubtitle(subTitle: TTexts.locationSubtitle),
        SizedBox(height: TSizes.spaceBtwItems,),
        DropDown2SearchableLocation(),
      ],
    );
  }
}
