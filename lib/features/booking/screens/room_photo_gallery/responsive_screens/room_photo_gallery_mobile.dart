import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../models/property/room.dart';
import '../widgets/room_photo_gallery_image_slider.dart';

class RoomPhotoGalleryMobileScreen extends StatelessWidget {
  final Room room;
  const RoomPhotoGalleryMobileScreen({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.jetBlack,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Photo Image Slider
            RoomPhotoGalleryImageSlider(room: room),
          ],
        ),
      ),
    );
  }
}
