import 'package:cwt_ecommerce_admin_panel/utils/constants/typography.dart';
import 'package:flutter/material.dart';
import '../../../../../../utils/constants/sizes.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
                width: 360,
                child: Text(
                  "Login or create an account",
                  textAlign: TextAlign.center,
                  style: TTypography.label16Bold,
                )),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
