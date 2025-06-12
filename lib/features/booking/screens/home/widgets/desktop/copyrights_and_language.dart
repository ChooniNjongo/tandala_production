import 'package:cwt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CopyrightsAndLanguage extends StatelessWidget {
  const CopyrightsAndLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpaceDesktop,vertical: 24),
      child: Row(

        children: [
          Text(
            "© Tandala 2025. All Rights Reserved",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'InterDisplay',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 1.4, // line-height of 140%
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }
}
