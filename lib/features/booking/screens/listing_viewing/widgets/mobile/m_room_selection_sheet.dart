import 'package:flutter/material.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../common/widgets/layouts/headers/widgets/desktop/search_filter/search_filter_header.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../models/property/listing_model.dart';
import 'bottom_sheet_rooms_selection.dart';

class MRoomSelectionSheet extends StatelessWidget {
  const MRoomSelectionSheet({super.key, required this.listing});

  final ListingModel listing;

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return TRoundedContainer(
      backgroundColor: TColors.dark,
      padding: EdgeInsets.zero,
      radius: 8,
      width: isMobile ? double.infinity : 1000,
      height: isMobile ? 590 : 480,
      child: Column(children: [
        const SearchFilterHeader(title: 'Choose a room'),
        Expanded(child: BottomSheetRoomsSelection(listing: listing)),
        //const FilterActionButtons()
      ]),
    );
  }
}
