import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/listing_data/listings_data.dart';
import '../../../models/property/listing_model.dart';
import '../widgets/common/action_buttons.dart';
import '../widgets/desktop/listing_header.dart';
import '../widgets/desktop/property_general_pictures.dart';
import '../widgets/mobile/mobile_tab_view.dart';

class ListingViewingDesktopScreen extends StatelessWidget {
  final ListingModel? listing;
  final bool isEditing;

  const ListingViewingDesktopScreen(
      {super.key, required this.listing, required this.isEditing});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Listing Header
            const SizedBox(height: TSizes.spaceBtwSections),
            ListingHeader(listing: listing!),
            const SizedBox(height: TSizes.spaceBtwSections),


            /// Image Cascade
         //   PropertyGeneralPictures(listing: listing!),
            const SizedBox(height: TSizes.spaceBtwSections),


            ///  Action Buttons
            const SizedBox(height: 7),
            ActionButtons(
              listing: listing!,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// TabBar and TabView
            MobileTabView(
              listing:  listing!,
              isEditing: isEditing,
            )
          ],
        ),
      ),
    );
  }
}
