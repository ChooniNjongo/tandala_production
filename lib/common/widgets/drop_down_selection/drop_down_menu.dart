import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../texts/t_brand_title_text.dart';

class TDropDownMenu extends StatelessWidget {
  const TDropDownMenu({
    super.key,
    required this.value,
    required this.itemTitles,
    this.icon, // Add the optional icon parameter
  });

  final Rx<String> value;
  final List<String> itemTitles;
  final Icon? icon; // Allow for null value

  @override
  Widget build(BuildContext context) {
    final uniqueItems = itemTitles.toSet().toList();
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
      () => DropdownButton(
        iconSize: 22,
        underline: Container(),
        dropdownColor: dark ? TColors.jetBlack : TColors.white,
        value: value.value,
        icon: null,
        // Use the passed icon or default
        style: Theme.of(context).textTheme.bodySmall!.apply(
            fontStyle: FontStyle.normal,
            color: dark ? TColors.white : TColors.jetBlack,
            fontSizeFactor: 0.8),
        onChanged: (String? newValue) {
          if (newValue != null) {
            value(newValue);
          }
        },
        items: uniqueItems.map(
          (category) {
            return DropdownMenuItem<String>(
              alignment:AlignmentDirectional.centerStart,
              value: category,
              child: TBrandTitleText(title: category),
            );
          },
        ).toList(),
      ),
    );
  }
}
