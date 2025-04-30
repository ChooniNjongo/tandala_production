import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class ButtonContainer extends StatelessWidget {
  final Widget button1;
  final Widget button2;

  const ButtonContainer({
    super.key,
    required this.button1,
    required this.button2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 32, top: 12),
      decoration: const BoxDecoration(
        color: TColors.dark,
        border: Border(
          top: BorderSide(
            color: TColors.iconBorder, // White border color
            width: 1, // Border width
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [button1, button2],
      ),
    );
  }
}
