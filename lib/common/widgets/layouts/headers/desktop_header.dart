import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/desktop/left_frame.dart';
import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/desktop/right_frame.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';

class DesktopHeader extends StatelessWidget {
  const DesktopHeader({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      padding: const EdgeInsets.symmetric(horizontal:TSizes.defaultSpaceDesktop, vertical:  24), // left, top, right, bottom
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        /// Left Frame
        LeftFrame(),
        /// Right Frame
        RightFrame(),
      ],),
    );
  }
}
