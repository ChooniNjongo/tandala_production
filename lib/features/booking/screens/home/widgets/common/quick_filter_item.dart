import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/constants/colors.dart';

class SecondaryFilterItem extends StatelessWidget {
  final bool isActive;
  final String icon;
  final String filterName;
  final void Function()? onTap;

  const SecondaryFilterItem(
      {super.key,
      required this.isActive,
      this.onTap,
      required this.filterName,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      onTap: onTap,
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            height: 22,
            semanticsLabel: 'Logo',
            color: isActive ? TColors.textPrimary : TColors.textSecondary,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            filterName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'InterDisplay',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 1.4, // 140% line-height
              letterSpacing: 0,
              color: isActive ? TColors.textPrimary : TColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
