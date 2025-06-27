import 'package:flutter/material.dart';

import '../desktop/search_filter/filter_action_button.dart';
import '../desktop/search_filter/filters.dart';

class MobileFilters extends StatelessWidget {
  const MobileFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.95,
      child: const Column(children: [
        Expanded(child: Filters()),
        FilterActionButtons(),
      ]),
    );
  }
}
