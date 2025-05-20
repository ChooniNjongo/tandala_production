import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/desktop/search_filter/price_filter_section.dart';
import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/desktop/search_filter/property_rules_filter.dart';
import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/desktop/search_filter/sort_by.dart';
import 'package:flutter/material.dart';

import '../../../../../../../common/widgets/containers/rounded_container.dart';
import 'amenities_filter.dart';
import 'filter_divider.dart';
import 'important_counts_fliter_section.dart';
import 'listing_type_filter.dart';
import 'location_filter.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: EdgeInsets.zero,
      radius: 8,
      width: 560,
      height: 432,
      child: Scrollbar(
        controller: _scrollController,
        // Attach the scroll controller
        thumbVisibility: true,
        // Always show the scrollbar
        thickness: 8.0,
        // Custom thickness
        radius: const Radius.circular(10),
        // Rounded corners for the scrollbar

        child: SingleChildScrollView(
          controller: _scrollController, // Attach the scroll controller
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LocationFilter(),
                FilterDivider(),
                SortBy(),
                FilterDivider(),
                ListingTypeFilter(),
                FilterDivider(),
                PriceFilterSection(),
                FilterDivider(),
                ImportantCountsFilterSection(),
                FilterDivider(),
                AmenitiesFilter(),
                FilterDivider(),
                PropertyRulesFilter(),
                FilterDivider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
