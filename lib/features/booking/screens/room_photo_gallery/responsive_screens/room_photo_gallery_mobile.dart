import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import '../../../../../utils/constants/color_system.dart';
import '../../../models/property/room.dart';
import '../widgets/room_photo_gallery_image_slider.dart';

class RoomPhotoGalleryMobileScreen extends StatelessWidget {
  final Room room;
  const RoomPhotoGalleryMobileScreen({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Iconsax.arrow_left,
                  color: TColorSystem.n500,
                )),
            /// Photo Image Slider
            RoomPhotoGalleryImageSlider(room: room),
          ],
        ),
      ),
    );
  }
}
