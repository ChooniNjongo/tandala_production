import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';


class MySpinKitLoadingIndicator extends StatelessWidget {
  const MySpinKitLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SpinKitWanderingCubes(
            color: TColors.white,
            size: 28,
          ),
          SizedBox(width: TSizes.spaceBtwItems,),
          SpinKitWanderingCubes(
            color: TColors.white,
            size: 28,
          ),
        ],
      ),
    );
  }
}
