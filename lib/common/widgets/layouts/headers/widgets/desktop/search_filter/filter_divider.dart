import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/sizes.dart';

class FilterDivider extends StatelessWidget {
  const FilterDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: TSizes.spaceBtwSections,),
        Container(
          height: 0.4,
          width: double.infinity,
          color: const Color(0xFF404747),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),
      ],
    );
  }
}
