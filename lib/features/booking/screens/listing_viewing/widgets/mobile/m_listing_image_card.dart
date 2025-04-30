import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../models/property/listing_model.dart';

class MListingImageCard extends StatefulWidget {
  final ListingModel listing;

  const MListingImageCard({super.key, required this.listing});

  @override
  State<MListingImageCard> createState() => _MListingImageCardState();
}

class _MListingImageCardState extends State<MListingImageCard> {
  final controller = CarouselSliderController();
  int activeIndex = 0;
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    //................ In Final Don't Show all the Images instead select three from aerial ,3 from each room..................
    imageUrls = widget.listing.getAllImages();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          options: CarouselOptions(
            height: screenHeight * .33,
            enableInfiniteScroll: false,
            initialPage: 0,
            viewportFraction: 1,
            //enableInfiniteScroll: false,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            //enlargeCenterPage: true,
            autoPlay: false,
            // height: MediaQuery.of(context).size.height * .50,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index, realIdx) {
            return SizedBox(
              width: double.infinity,
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        Positioned(
            left: 12, top: 12, child: TCircularIcon(
          icon: Icons.chevron_left,
          size: 24,
          color: TColors.black,
          backgroundColor: TColors.white,
          onPressed: () {
            Get.back();
          },
        )),
         Positioned(
            right: 12,
            bottom: 12,
            child: TRoundedContainer(
              radius: 4,
              padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
              backgroundColor: TColors.jetBlack.withOpacity(0.5),
              child: Text(
                "${activeIndex + 1} / ${imageUrls.length}",
                style: const TextStyle(color: Colors.white),
              ),
            ))
      ],
    );
  }
}
