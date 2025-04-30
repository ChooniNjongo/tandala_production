import 'package:cwt_ecommerce_admin_panel/common/widgets/navigation/tab_navigation/tab_item.dart';
import 'package:flutter/material.dart';

class TabNavigationContainer extends StatelessWidget {
  const TabNavigationContainer({
    super.key,
    required this.tabItems,
  });

  final List<TabItem> tabItems; // Accept a list of TabItem widgets

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tabItems
            .asMap()
            .entries
            .map((entry) => Row(
                  children: [
                    entry.value, // Add TabItem
                    if (entry.key < tabItems.length - 1)
                      const SizedBox(width: 32), // Add spacing between TabItems
                  ],
                ))
            .toList(),
      ),
    );
  }
}
