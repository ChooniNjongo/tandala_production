import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/color_system.dart';
import '../../../../utils/constants/typography.dart';

class SvgNavIcon extends StatelessWidget {
  final String navIcon;
  final bool isSelected;
  final bool count;
  final int? notificationCount;
  final Color notificationColor;

  const SvgNavIcon({
    super.key,
    required this.navIcon,
    this.isSelected = false,
    this.count = false,
    this.notificationColor = TColorSystem.n200, this.notificationCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          navIcon,
          color: isSelected ? const Color(0xFF00AFC1) : TColors.textPrimary,
          height: 24,
          width: 24,
        ),
        Visibility(
          visible: notificationCount!>0,
          child: Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color:notificationColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      notificationCount.toString(),
                      style: TTypography.label12Bold.copyWith(
                        color: TColorSystem.n900,
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
