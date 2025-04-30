import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../controllers/room_photo_gallery_controller.dart';
import '../../../models/property/room.dart';
import '../widgets/room_photo_gallery_image_slider.dart';

class RoomPhotoGalleryMobileScreen extends StatelessWidget {
  final Room room;
  const RoomPhotoGalleryMobileScreen({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RoomPhotoGalleryController());
    return Obx(
          () => Scaffold(
        backgroundColor: Colors.black,
        appBar: TAppBar(
          title:
          Text("${controller.activeIndex.value + 1}/${room.getAllImages().length}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// Photo Image Slider
              RoomPhotoGalleryImageSlider(room: room),
            ],
          ),
        ),
      ),
    );
  }
}
