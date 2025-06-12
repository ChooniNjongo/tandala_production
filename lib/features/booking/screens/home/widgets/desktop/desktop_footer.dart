import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'copyrights_and_language.dart';
import 'desktop_footer_links.dart';
import 'logo_and_social_icons.dart';

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({super.key});

  @override
  Widget build(BuildContext context) {
    /// Desktop Filter- We follow explicit design implementation
    return const Column(
      children: [
        // Logo and Social Icons
        LogoAndSocialIcons(),
        FooterDivider(),
        // Footer Links
        DesktopFooterLinks(),
        // Copyrights / Language
        FooterDivider(),
        CopyrightsAndLanguage()
      ],
    );
  }
}

class FooterDivider extends StatelessWidget {
  const FooterDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpaceDesktop, vertical: 24),
      child: Divider(
        height: 1,
        color: Color(0xFF1A2323),
      ),
    );
  }
}
