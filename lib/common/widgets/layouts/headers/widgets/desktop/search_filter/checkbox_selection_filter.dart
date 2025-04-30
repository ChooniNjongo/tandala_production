import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/helpers/helper_functions.dart';

class CheckboxFilterSelection extends StatelessWidget {
  final String selectionType;
  final bool isSelected;

  const CheckboxFilterSelection(
      {super.key, required this.selectionType, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Checkbox(value: isSelected, onChanged: null),
        const SizedBox(width: TSizes.spaceBtwItems / 4),
        Text(
          selectionType,
          style: Theme.of(context).textTheme.bodySmall!.apply(
              color: dark ? TColors.white : TColors.jetBlack,
              fontSizeFactor: 0.8),
        ),
        const SizedBox(width: TSizes.spaceBtwItems*1.2),
      ],
    );
  }
}