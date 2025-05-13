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
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                activeColor: TColors.primary500,
                checkColor: TColors.white,
                value: value,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            amenityType,

          ),
        ),
      ],
    );
  }
}
