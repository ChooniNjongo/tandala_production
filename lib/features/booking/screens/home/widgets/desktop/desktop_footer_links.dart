import 'package:flutter/material.dart';

import '../../../../../../utils/constants/sizes.dart';
import '../common/download_app.dart';
import '../common/legal.dart';
import '../common/quick_links.dart';
import 'email_subscription.dart';

class DesktopFooterLinks extends StatelessWidget {
  const DesktopFooterLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpaceDesktop, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Quick Links
          QuickLinks(),

          /// Legal
          Legal(),

          /// Download App CTA
          DownloadApp(),
          ///  Email Subscription
          EmailSubscription()
        ],
      ),
    );
  }
}
