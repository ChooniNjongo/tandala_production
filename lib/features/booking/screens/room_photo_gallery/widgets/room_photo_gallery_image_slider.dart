import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/room_photo_gallery_controller.dart';
import '../../../models/property/room.dart';

class RoomPhotoGalleryImageSlider extends StatefulWidget {
  final Room room;
  const RoomPhotoGalleryImageSlider({super.key, required this.room});

  @override
  State<RoomPhotoGalleryImageSlider> createState() =>
      _RoomPhotoGalleryImageSliderState();
}

class _RoomPhotoGalleryImageSliderState
    extends State<RoomPhotoGalleryImageSlider> {
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    imageUrls = widget.room.getAllImages();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RoomPhotoGalleryController());
    final screenHeight = MediaQuery.sizeOf(context).height;
    return CarouselSlider.builder(
      carouselController: controller.carousalController,
      options: CarouselOptions(
        height: screenHeight * .9,
        enableInfiniteScroll: false,
        initialPage: 0,
        viewportFraction: 1,
        //enableInfiniteScroll: false,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        //enlargeCenterPage: true,
        autoPlay: false,
        // height: MediaQuery.of(context).size.height * .50,
        onPageChanged: (index, reason) => setState(() => controller.activeIndex.value = index),
      ),
      itemCount: imageUrls.length,
      itemBuilder: (context, index, realIdx) {
        return SizedBox(
          width: double.infinity,
          child: Image.network(imageUrls[index], fit: BoxFit.fitWidth),
        );
      },
    );
  }
}
