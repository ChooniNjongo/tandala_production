import 'package:cwt_ecommerce_admin_panel/features/booking/screens/room_viewing/responsive_screens/room_viewing_desktop.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/screens/room_viewing/responsive_screens/room_viewing_mobile.dart';
import 'package:cwt_ecommerce_admin_panel/features/booking/screens/room_viewing/responsive_screens/room_viewing_tablet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/layouts/templates/site_layout.dart';
import '../../models/property/room.dart';

class RoomViewingScreen extends StatelessWidget {
  const RoomViewingScreen({super.key, this.room});

  final Room? room;

  @override
  Widget build(BuildContext context) {
    final room = Get.arguments as Room;
    return TSiteTemplate(
      useLayout: false,
      desktop: const RoomViewingDesktopScreen(),
      tablet: const RoomViewingTabletScreen(),
      mobile: RoomViewingMobileScreen(room: room),
    );
  }
}
