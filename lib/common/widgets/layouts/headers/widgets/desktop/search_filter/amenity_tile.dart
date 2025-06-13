import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/colors.dart';

class AmenityTile extends StatelessWidget {
  const AmenityTile({
    super.key,
    required this.amenityType,
    required this.value,
    required this.onChanged,
  });

  final String amenityType;
  final bool value;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              side: const BorderSide(
                color: Colors.white,
                width: 0.6,
              ),
              activeColor: TColors.primary,
              checkColor: TColors.white,
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          amenityType,
          style: const TextStyle(
            fontFamily: 'InterDisplay',
            fontWeight: FontWeight.w400,
            fontSize: 13,
            height: 1.4, // 140% line height
            letterSpacing: 0,
            color: Color(0xFF888888),
          ),
        ),
      ],
    );
  }
}
