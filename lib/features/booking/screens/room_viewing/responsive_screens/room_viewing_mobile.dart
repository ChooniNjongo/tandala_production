import 'package:flutter/material.dart';

import '../../../models/property/room.dart';
import '../widgets/common/roomviewing_bottom_navigation_widget.dart';
import '../widgets/mobile/body.dart';

class RoomViewingMobileScreen extends StatelessWidget {
  const RoomViewingMobileScreen({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RoomViewingBody(room: room),
      bottomNavigationBar: RoomViewingBottomNavigationButtons(room: room),
    );
  }
}
