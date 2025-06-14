import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'desktop_navbar.dart';

class LeftFrame extends StatelessWidget {
  const LeftFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Logo
        SizedBox(
          width: 100,
          height: 24,
          child: SvgPicture.asset(TImages.tandalaSvg,color: TColors.primary,),
        ),
        const SizedBox(width: 24,),

        ///  Nav Bar
      //  const DesktopNavbar()
      ],
    );
  }
}
