import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../routes/routes.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';

class TandalaLogo extends StatelessWidget {
  final double? height;
  final double? width;

  const TandalaLogo({
    super.key,
    this.height = 24,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(TRoutes.places),
      child: SvgPicture.asset(
        TImages.tandalaSvg,
        height: height,
        width: width,
        semanticsLabel: 'Logo',
      ),
    );
  }
}