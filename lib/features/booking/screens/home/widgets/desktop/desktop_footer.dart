import 'package:flutter/material.dart';

import 'copyrights_and_language.dart';
import 'desktop_footer_links.dart';
import 'logo_and_social_icons.dart';

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({super.key});

  @override
  Widget build(BuildContext context) {
    /// Desktop Filter- We follow explicit design implementation
    return const Column(children: [
      // Logo and Social Icons
      LogoAndSocialIcons(),
      // Footer Links
      DesktopFooterLinks(),
      // Copyrights / Language
      CopyrightsAndLanguage()
    ],);
  }
}
