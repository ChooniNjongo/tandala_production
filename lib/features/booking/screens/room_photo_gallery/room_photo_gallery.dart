import 'package:cwt_ecommerce_admin_panel/features/booking/screens/room_photo_gallery/responsive_screens/room_photo_gallery_mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/layouts/templates/site_layout.dart';

class RoomPhotoGalleryScreen extends StatelessWidget {
  const RoomPhotoGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final room = Get.arguments;
    return TSiteTemplate(
      useLayout: false,
      desktop: RoomPhotoGalleryMobileScreen(room: room),
      tablet: RoomPhotoGalleryMobileScreen(room: room),
      mobile: RoomPhotoGalleryMobileScreen(room: room),
    );
  }
}
