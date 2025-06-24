import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../containers/rounded_container.dart';
import '../../logo/logo.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 16),
      radius: 0,
      borderWidth: 1,
      showShadow: false,
      height: 84,
      backgroundColor: TColors.primaryBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Menu Icon
          SvgPicture.asset(
            TImages.menuBars,
            height: 32,
            width: 32,
          ),

          /// Tandala Logo
          const TandalaLogo(),

          /// Notification Icon
          SvgPicture.asset(
            TImages.bell,
            height: 32,
            width: 32 ,
          ),
        ],
      ),
    );
  }
}
