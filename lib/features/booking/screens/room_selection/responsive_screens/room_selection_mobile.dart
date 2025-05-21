import 'package:flutter/material.dart';
import '../../../models/property/listing_model.dart';
import '../widgets/body.dart';

class RoomSelectionMobileScreen extends StatelessWidget {
  final ListingModel listing;

  const RoomSelectionMobileScreen({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RoomSelectionBody(
          rooms: listing.rooms,
        ));
  }
}
