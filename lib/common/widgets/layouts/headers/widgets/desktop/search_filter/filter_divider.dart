import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/sizes.dart';

class FilterDivider extends StatelessWidget {
  const FilterDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          const SizedBox(height: 8,),
          Container(
            height: 1,
            width: double.infinity,
            color: const Color(0xFF001113),
          ),
          const SizedBox(height: 8,),
        ],
      ),
    );
  }
}
