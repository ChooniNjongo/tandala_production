import 'package:carousel_slider/carousel_slider.dart';
import 'package:cwt_ecommerce_admin_panel/common/widgets/icons/t_circular_icon.dart';
import 'package:flutter/material.dart';
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
    final double carouselHeight = screenHeight * 0.26;
    const double iconSize = 32;
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          options: CarouselOptions(
            height: screenHeight * .26,
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

        /// Previous Image
        Visibility(
          visible: activeIndex > 0,
          child: Positioned(
              left: 12,
              top: (carouselHeight - iconSize) / 2,
              child: TCircularIcon(
                  onPressed: () {
                    if (activeIndex < imageUrls.length - 1) {
                      controller.previousPage();
                    }
                  },
                  backgroundColor: Colors.blueGrey.withOpacity(0.3),
                  icon: Icons.chevron_left,
                  color: Colors.white,
                  size: 32)),
        ),

        /// Next Image
        Visibility(
          visible: activeIndex < imageUrls.length - 1,
          child: Positioned(
              right: 12,
              top: (carouselHeight - iconSize) / 2,
              child: TCircularIcon(
                onPressed: () {
                  if (activeIndex < imageUrls.length - 1) {
                    controller.nextPage();
                  }
                },
                backgroundColor: Colors.blueGrey.withOpacity(0.3),
                icon: Icons.chevron_right,
                color: Colors.white,
                size: 32,
              )),
        ),

      ],
    );
  }
}
