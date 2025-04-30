import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/photo_gallery_image_controller.dart';
import '../../../models/property/listing_model.dart';

class PhotoGalleryImageSlider extends StatefulWidget {
  final ListingModel listing;
  const PhotoGalleryImageSlider({super.key, required this.listing});

  @override
  State<PhotoGalleryImageSlider> createState() =>
      _PhotoGalleryImageSliderState();
}

class _PhotoGalleryImageSliderState extends State<PhotoGalleryImageSlider> {
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    imageUrls = widget.listing.getAllImages();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhotoGalleryController());
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
