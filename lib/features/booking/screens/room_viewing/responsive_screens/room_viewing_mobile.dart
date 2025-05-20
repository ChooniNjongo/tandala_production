import 'package:flutter/material.dart';

import '../../../../../common/pages/action.dart';
import '../../../models/property/room.dart';
import '../widgets/common/room_viewing_button_contianer.dart';
import '../widgets/mobile/body.dart';

class RoomViewingMobileScreen extends StatelessWidget {
  const RoomViewingMobileScreen({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    return ActionPage(
      body: RoomViewingBody(room: room),
      buttonContainer: RoomViewingButtonContainer(room: room),
    );
  }
}
