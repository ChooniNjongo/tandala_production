import 'package:flutter/material.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../models/property/listing_model.dart';
import '../common/reviews_tab.dart';
import '../desktop/reviews_tab_desktop.dart';
import 'about_listing.dart';
import 'amenities_tab_section.dart';
import 'map_tab_section.dart';

class MobileTabView extends StatelessWidget {
  const MobileTabView({super.key, required this.listing, required this.isEditing});

  final ListingModel listing;
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: isMobile ? double.infinity : 600,
            child: const TabBar(
              dividerColor: TColors.iconBorder,
              dividerHeight: 1,
              unselectedLabelStyle: TextStyle(
                  color: TColors.primary500,
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
              labelColor: TColors.white,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: "About"),

                Tab(text: "Facilities"),
                Tab(text: "Reviews"),
                Tab(text: "Map"),
              ],
            ),
          ),
          // TabBar View
          SizedBox(
            height: 400, // Set height for TabBarView
            child: TabBarView(
              children: [
                AboutListing(listing: listing, isEditing: isEditing,),

                AmenitiesTabSection(
                  isEditing: isEditing,
                ),
                isMobile
                    ? ReviewsTab(listing: listing)
                    : ReviewsTabDesktop(listing: listing),
                 MapTabSection(isEditing: isEditing,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
