import 'package:cwt_ecommerce_admin_panel/features/listing/screens/load_user_draft_listing/responsive_screens/load_user_draft_listing_mobile.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';

class LoadUserDraftListingScreen extends StatelessWidget {
  const LoadUserDraftListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const TSiteTemplate(
      useLayout: false,
      desktop: LoadUserDraftListingMobile(),
      tablet:  LoadUserDraftListingMobile(),
      mobile:  LoadUserDraftListingMobile(),
    );
  }
}
