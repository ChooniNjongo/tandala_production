// File: lib/features/search/widgets/search_and_filters.dart

import 'package:flutter/material.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/sizes.dart';
import '../desktop/start_search.dart';
import 'filter_button.dart';
import 'filter_overlay_service.dart';

class TSearchAndFilters extends StatefulWidget {
  const TSearchAndFilters({super.key});

  @override
  State<TSearchAndFilters> createState() => _TSearchAndFiltersState();
}

class _TSearchAndFiltersState extends State<TSearchAndFilters> {
  late final FilterOverlayService _filterOverlayService;

  @override
  void initState() {
    super.initState();
    _filterOverlayService = FilterOverlayService();
  }

  @override
  void dispose() {
    _filterOverlayService.dispose();
    super.dispose();
  }

  void _onFilterButtonPressed() {
    _filterOverlayService.showFilterOverlay(context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const StartSearch(),
            const SizedBox(width: TSizes.spaceBtwItems),
            FilterButton(onPressed: _onFilterButtonPressed),
          ],
        ),
      ],
    );
  }
}