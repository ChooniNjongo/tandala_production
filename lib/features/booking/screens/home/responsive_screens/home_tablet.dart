import 'package:flutter/material.dart';

import '../../../../../utils/constants/color_system.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/typography.dart';


class HomeTabletScreen extends StatelessWidget {
  const HomeTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            const SizedBox(height: TSizes.spaceBtwSections * 2,),
            Text("Tablet mode coming soon.",
                style: TTypography.h1.apply(color: Colors.white)),
            const SizedBox(height: TSizes.spaceBtwSections * 2,),
            Text("Please use PC browser or download the mobile app.",
                style: TTypography.body14Regular.apply(color: TColorSystem.n300)),

            const SizedBox(height: TSizes.spaceBtwSections * 2,),

          ],
        ));
  }
}
