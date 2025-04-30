import 'package:flutter/material.dart';

class FilterItemLayout extends StatelessWidget {
  const FilterItemLayout(
      {super.key, required this.filterName, required this.filter});

  final Widget filterName;
  final Widget filter;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 1, child: filterName),
        Expanded(flex: 4, child: filter),
      ],
    );
  }
}
