import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/desktop/search_filter/search_location.dart';
import 'package:flutter/material.dart';
import '../../../../../../../utils/constants/text_strings.dart';
import 'filter_section_title.dart';

class LocationFilter extends StatelessWidget {
  const LocationFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterSectionTitle(title: TTexts.location),
        SizedBox(height:8),
        FilterSectionSubtitle(subTitle: TTexts.locationSubtitle),
        SizedBox(height: 16,),
        // Add search location search widhere here
      ],
    );
  }
}
