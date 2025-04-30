import 'package:flutter/material.dart';
import '../../../../../common/pages/action.dart';
import '../../../../../common/widgets/overrlay_header/overlay_header.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../models/property/listing_model.dart';
import '../widgets/body.dart';

class RoomSelectionMobileScreen extends StatelessWidget {
  final ListingModel listing;

  const RoomSelectionMobileScreen({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return ActionPage(
        overlayHeader: const OverlayHeader(
          label: 'Room Selection',
          leftIcon: TImages.arrowLeft,
          rightIconColor: Colors.transparent,
        ),
        body: RoomSelectionBody(
          rooms: listing.rooms,
        ));
  }
}
