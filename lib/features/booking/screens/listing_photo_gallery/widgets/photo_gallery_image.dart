import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../utils/constants/color_system.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../models/property/listing_model.dart';

class PhotoGalleryImageSlider extends StatefulWidget {
  final ListingModel listing;
  const PhotoGalleryImageSlider({super.key, required this.listing});

  @override
  State<PhotoGalleryImageSlider> createState() =>
      _PhotoGalleryImageSliderState();
}

class _PhotoGalleryImageSliderState extends State<PhotoGalleryImageSlider> {
  final controller = CarouselSliderController();
  List<String> imageUrls = [];
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
    imageUrls = widget.listing.getAllImages() + widget.listing.getAllImages();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final double carouselHeight = screenHeight * 1;
    const double iconSize = 32;
    return Container(
      color: TColors.jetBlack,
      child: Stack(
        children: [
          CarouselSlider.builder(
            carouselController: controller,
            options: CarouselOptions(
              autoPlay: true,
              height: screenHeight * 1,
              enableInfiniteScroll: false,
              initialPage: 0,
              viewportFraction: 1,
              //enableInfiniteScroll: false,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,

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
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        /// Previous Page
          Positioned(
            top: 24,
            left: 24,
            child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Iconsax.arrow_left,
                  color: TColorSystem.n200,
                )),
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

          /// Animated Smooth Progress Indicator
          Visibility(
            visible: false,
            child: Positioned(
              top: 56, // adjust as needed
              left: 0,
              right: 0,
              child: Center(
                child: buildIndicator(),
              ),
            ),
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
          Positioned(
              right: 12,
              bottom: 12,
              child: TRoundedContainer(
                radius: 4,
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                backgroundColor: TColors.jetBlack.withOpacity(0.5),
                child: Text(
                  "${activeIndex + 1} / ${imageUrls.length}",
                  style: const TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }

  Widget buildIndicator() {
    final screenWidth = MediaQuery.of(context).size.width;
    final dotCount = imageUrls.length;

    // Constraints
    const maxDotWidth = 16.0;
    const minDotWidth = 6.0;
    const maxSpacing = 8.0;
    const minSpacing = 2.0;

    // Estimate maximum available space for dots and spacings
    final availableWidth = screenWidth * 0.9;

    // Try with max spacing first
    double spacing = maxSpacing;
    double dotWidth = (availableWidth - (spacing * (dotCount - 1))) / dotCount;

    // If dotWidth is too small, reduce spacing
    if (dotWidth < minDotWidth) {
      spacing = (availableWidth - (minDotWidth * dotCount)) / (dotCount - 1);
      spacing = spacing.clamp(minSpacing, maxSpacing);
      dotWidth = (availableWidth - (spacing * (dotCount - 1))) / dotCount;
    }

    // Clamp final dotWidth
    dotWidth = dotWidth.clamp(minDotWidth, maxDotWidth);

    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: dotCount,
      onDotClicked: animateToSlide,
      effect: WormEffect(
        dotWidth: dotWidth,
        dotHeight: 6,
        spacing: spacing,
        activeDotColor: TColors.primary500,
        dotColor: Colors.grey,
      ),
    );
  }

  Widget buildButtons({bool stretch = false}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 23),
            ),
            onPressed: previous,
            child: const Icon(Icons.arrow_back, size: 23),
          ),
          stretch ? const Spacer() : const SizedBox(width: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 23),
            ),
            onPressed: next,
            child: const Icon(Icons.arrow_forward, size: 23),
          ),
        ],
      );

  void next() {
    controller.nextPage(duration: const Duration(milliseconds: 500));
  }

  void previous() {
    controller.previousPage(duration: const Duration(milliseconds: 500));
  }

  animateToSlide(int index) => controller.animateToPage(index);
}
