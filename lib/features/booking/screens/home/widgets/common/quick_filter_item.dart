import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../../../utils/device/device_utility.dart';

class SecondaryFilterItem extends StatelessWidget {
  final Color border;
  final bool isActive;
  final String activeIcon;
  final String inactiveIcon;
  final String filterName;
  final void Function()? onTap;

  const SecondaryFilterItem(
      {super.key,
      required this.isActive,
      required this.activeIcon,
      required this.inactiveIcon,
      required this.border,
      this.onTap,
      required this.filterName});

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return TRoundedContainer(

      onTap: onTap,
      padding: const EdgeInsets.all(4),
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(left: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
           activeIcon ,
            height: 22,
            semanticsLabel: 'Logo',
            color: isActive ? TColorSystem.primary500 : TColors.textIconFilterInactive,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            filterName,
            style: TTypography.body12Regular.copyWith(fontSize: 11,
                fontWeight: isActive ? FontWeight.w500 : FontWeight.w500,
                color: isActive
                    ? (TColors.white)
                    : (TColors.textIconFilterInactive)),
          ),
          if(!isMobile)
           const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
