import 'package:flutter/material.dart';

import 'input_list_item.dart';

class InputList extends StatelessWidget {
  const InputList({
    super.key,
    required this.listOfListInputItems,
  });

  final List<TInputListItem> listOfListInputItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: listOfListInputItems.map((item) => item).toList(),
    );
  }
}