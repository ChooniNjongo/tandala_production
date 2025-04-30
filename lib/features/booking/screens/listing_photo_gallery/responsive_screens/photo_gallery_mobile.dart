import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../controllers/photo_gallery_image_controller.dart';
import '../../../models/property/listing_model.dart';
import '../widgets/photo_gallery_image.dart';

class PhotoGalleryMobileScreen extends StatelessWidget {
  final ListingModel listing;

  const PhotoGalleryMobileScreen({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhotoGalleryController());
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.black,
        appBar: TAppBar(
          title: Text(
              "${controller.activeIndex.value + 1}/${listing.getAllImages().length}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// Photo Image Slider
              PhotoGalleryImageSlider(listing: listing),
            ],
          ),
        ),
      ),
    );
  }
}
