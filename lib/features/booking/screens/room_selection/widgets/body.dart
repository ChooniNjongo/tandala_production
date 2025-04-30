import 'package:flutter/material.dart';

import '../../../models/property/room.dart';
import '../../listing_viewing/widgets/common/bottom_sheet_room_card.dart';

class RoomSelectionBody extends StatelessWidget {
  const RoomSelectionBody({super.key, required this.rooms});

  final List<Room> rooms;

  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: rooms.map((room) {
          return BottomSheetRoomPreviewCard(room: room);
        }).toList(),
      ),
    );
  }
}
