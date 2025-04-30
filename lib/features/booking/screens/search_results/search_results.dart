import 'package:cwt_ecommerce_admin_panel/features/booking/screens/search_results/responsive_screens/search_results_mobile.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/layouts/templates/site_layout.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      useLayout: false,
      desktop: SearchResultsMobile(),
      tablet: SearchResultsMobile(),
      mobile: SearchResultsMobile(),
    );
  }
}
