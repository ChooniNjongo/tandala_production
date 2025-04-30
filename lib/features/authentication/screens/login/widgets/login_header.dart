import 'package:cwt_ecommerce_admin_panel/utils/constants/typography.dart';
import 'package:flutter/material.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
                width: 360,
                child: Text(
                  "Login or create an",
                  textAlign: TextAlign.center,
                  style: TTypography.label14Regular.copyWith(fontSize: 26),
                )),
          ),
          Center(
              child: SizedBox(
            width: 360,
            child: Text(
              "account to enjoy great stays",
              textAlign: TextAlign.center,
              style: TTypography.label14Regular.copyWith(fontSize: 26),
            ),
          )),
          const SizedBox(height: TSizes.spaceBtwSections),
          ///
        ],
      ),
    );
  }
}
