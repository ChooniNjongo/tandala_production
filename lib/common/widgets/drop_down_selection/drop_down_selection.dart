import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../utils/constants/colors.dart';
import '../containers/rounded_container.dart';
import 'drop_down_menu.dart';

class TDropDownSelection extends StatelessWidget {
  const TDropDownSelection({
    super.key,
    required this.title,
    required this.value,
    required this.itemTitles,
    this.icon, required this.isSelected, // Add the optional icon parameter
  });

  final String title;
  final Rx<String> value;
  final List<String> itemTitles;
  final Icon? icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          child: TRoundedContainer(
            width: 300,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            showBorder: true,
            radius: 4,
            backgroundColor:
                 TColors.primaryBackground ,
            borderColor:TColors.iconBorder,
            borderWidth:isSelected? 1.5: 1.5,
            showShadow: false,
            child: TDropDownMenu(
                value: value,
                itemTitles: itemTitles,
                icon: icon // Pass the icon down to TDropDownMenu
                ),
          ),
        ),
        // const Icon(Icons.arrow_drop_down),
      ],
    );
  }
}
