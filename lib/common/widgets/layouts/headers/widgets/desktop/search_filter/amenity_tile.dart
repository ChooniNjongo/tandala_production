import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../utils/constants/colors.dart';

class AmenityTile extends StatelessWidget {
  const AmenityTile({
    super.key,
    required this.amenityType,
    required this.value,
    required this.onChanged, required this.isSelected,
  });

  final String amenityType;
  final bool value;
  final void Function(bool?) onChanged;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 204.5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(isSelected)
            SvgPicture.asset("assets/icons/designer_assets/check-square.svg"),
          if(!isSelected)
            SvgPicture.asset("assets/icons/designer_assets/check-square_minus.svg"),

          const SizedBox(
            width: 12,
          ),
          Text(
            amenityType,
            style: const TextStyle(
              fontFamily: 'InterDisplay',
              fontWeight: FontWeight.w400,
              fontSize: 13,
              height: 1.3, // 140% line height
              letterSpacing: 0,
              color: Color(0xFF888888),
            ),
          ),
        ],
      ),
    );
  }
}
