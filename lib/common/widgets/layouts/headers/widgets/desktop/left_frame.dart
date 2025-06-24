import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../utils/constants/sizes.dart';
import 'desktop_navbar.dart';

class LeftFrame extends StatelessWidget {
  const LeftFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Logo
        SizedBox(
          width: 134,
          height: 24,
          child: SvgPicture.asset(
            TImages.tandalaSvg,
          ),
        ),

        const SizedBox(
          width: TSizes.spaceBtwSections,
        ),

        NavbarItem(
          isSelected: true,
          name: 'Apartments',
          icon: TImages.apartment,
          onPressed: () {},
        ),

        NavbarItem(
          isSelected: false,
          name: 'Hotels',
          icon: TImages.hotel,
          onPressed: () {},
        ),

        NavbarItem(
          isSelected: false,
          name: 'Lodges',
          icon: TImages.lodge,
          onPressed: () {},
        )

        ///  Nav Bar
        //const DesktopNavbar()
      ],
    );
  }
}
