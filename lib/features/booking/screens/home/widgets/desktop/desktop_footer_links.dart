import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../common/quick_links.dart';

class DesktopFooterLinks extends StatelessWidget {
  const DesktopFooterLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.symmetric(horizontal:TSizes.defaultSpaceDesktop ,vertical: 24),
      child: Row(children: [

        /// Quick Links
        QuickLinks()
        /// Legal

        /// Download App CTA
        ///  Email Subscription
      ],),
    );
  }
}
