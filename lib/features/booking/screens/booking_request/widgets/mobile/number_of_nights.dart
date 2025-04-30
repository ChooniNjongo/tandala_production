import 'package:flutter/material.dart';

import '../../../../../../common/widgets/selection/circular_count_select.dart';

class NumberOfNights extends StatelessWidget {
  const NumberOfNights({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircularCountSelect(count: '1',),
        CircularCountSelect(count: '2',isSelected:true),
        CircularCountSelect(count: '3',),
        CircularCountSelect(count: '4',),


      ],
    );
  }
}


