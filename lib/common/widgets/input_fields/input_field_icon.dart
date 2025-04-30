import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constants/color_system.dart';

class InputFieldIcon extends StatelessWidget {
  const InputFieldIcon({
    super.key,
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: SvgPicture.asset(
        icon,
        color: TColorSystem.n600,
        fit: BoxFit.contain,
      ),
    );
  }
}
