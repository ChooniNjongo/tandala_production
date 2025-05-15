import 'package:flutter/material.dart';

import '../../../../../common/widgets/layouts/templates/site_layout.dart';
import 'responsive_screens/create_listing_desktop.dart';
import 'responsive_screens/create_listing_mobile.dart';

class CreateListingScreen extends StatelessWidget {
  const CreateListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(desktop: CreateListingDesktopScreen(), mobile: CreateListingMobileScreen());
  }
}
