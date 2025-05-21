import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/color_system.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/typography.dart';

class PageSectionHeader extends StatelessWidget {
  const PageSectionHeader({
    super.key,
    required this.headerLabel,
     this.icon = TImages.shoppingBag,
    this.onTextLabelPressed,
    this.small = false,
    this.textButton = false,
    this.useHeaderActionIcon = false,
    this.headerActionIcon = const SizedBox.shrink(),
    this.useFeaturedHeaderSection = false,
    this.useIcon = false,
    this.useBrandIcon = false,
    this.textLabel = "View all",
     this.outlineButtonLabel = "Edit",
     this.showOutlineButton = false, this.onOutlineButtonPressed,
  });

  final String headerLabel;
  final String textLabel;
  final String outlineButtonLabel;
  final String icon;
  final bool small;
  final bool useIcon;
  final bool useBrandIcon;
  final bool showOutlineButton;
  final bool textButton;
  final bool useHeaderActionIcon;
  final bool useFeaturedHeaderSection;
  final Widget headerActionIcon;
  final void Function()? onTextLabelPressed;
  final void Function()? onOutlineButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// App Icon
        if (useBrandIcon) SvgPicture.asset(TImages.appIcon),
        // Header Text
        Text(
          headerLabel,
          style: small
              ? TTypography.h5.copyWith(color: TColorSystem.n400)
              : TTypography.h5.copyWith(color: TColorSystem.n400),
        ),
        // Conditionally render Icon, Text Button, or Header Action Icon
        if (useIcon)
          IconButton(
            onPressed: onTextLabelPressed,
            icon: SvgPicture.asset(
              icon,
              color: TColorSystem.n200,
            ),
          ),
        if (useHeaderActionIcon) headerActionIcon,
        if (textButton)
          GestureDetector(
            onTap: onTextLabelPressed,
            child: Text(
              textLabel,
              style:
                  TTypography.label14Regular.copyWith(color: TColorSystem.n600),
            ),
          ),

        if (useFeaturedHeaderSection)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                TImages.chevronLeft,
                color: TColorSystem.n700,
                height: 20,
              ),
              const SizedBox(
                width: 4,
              ),
              SvgPicture.asset(
                TImages.chevronRight,
                color: TColorSystem.n400,
                height: 20,
              ),
            ],
          ),

        /// Outline button
        if (showOutlineButton)
          SizedBox(
            width: TSizes.buttonWidth,
            child: ElevatedButton(
              onPressed: onOutlineButtonPressed,
              child: Text( outlineButtonLabel),
            ),
          ),

      ],
    );
  }
}
