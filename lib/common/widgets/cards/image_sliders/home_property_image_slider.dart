import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../features/booking/models/property/listing_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/t_circular_icon.dart';

class PropertyHomeImageSlider extends StatefulWidget {
  final ListingModel property;
  bool isHovering;

  PropertyHomeImageSlider({
    super.key,
    required this.property,
    this.isHovering = false,
  });

  @override
  State<PropertyHomeImageSlider> createState() =>
      _PropertyHomeImageSliderState();
}

class _PropertyHomeImageSliderState extends State<PropertyHomeImageSlider> {
  final controller = CarouselSliderController();
  int activeIndex = 0;
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    //................ In Final Don't Show all the Images instead select three from aerial ,3 from each room..................
    imageUrls = widget.property.getAllImages().sublist(0, 5);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: TColors.secondaryBackground2,
              borderRadius: BorderRadius.circular(TSizes.borderRadiusMd), // Circular border radius
            ),
            child: SizedBox(
              child: CarouselSlider.builder(
                carouselController: controller,
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  viewportFraction: 1,
                  //enableInfiniteScroll: false,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  //enlargeCenterPage: true,
                  autoPlay: false,
                  height: MediaQuery.of(context).size.height * .30,
                  onPageChanged:
                      (index, reason) => setState(() => activeIndex = index),
                ),
                itemCount: imageUrls.length,
                itemBuilder: (context, index, realIdx) {
                  return SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
                      child: Image.network(imageUrls[index], fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(bottom: 24, right: 136, child: buildIndicator()),
          Visibility(
            visible: widget.isHovering && activeIndex != imageUrls.length - 1,
            child: Positioned(
              bottom: 100,
              right: 25,
              child: TCircularIcon(
                icon: Icons.chevron_right,
                size: 16,
                width: 32,
                height: 32,
                color: TColors.black,
                backgroundColor: TColors.white,
                onPressed: () => next(),
              ),
            ),
          ),
          Visibility(
            visible: widget.isHovering && activeIndex != 0,
            child: Positioned(
              bottom: 100,
              left: 25,
              child: TCircularIcon(
                icon: Icons.chevron_left,
                size: 16,
                width: 32,
                height: 32,
                color: TColors.black,
                backgroundColor: TColors.white,
                onPressed: () => previous(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: imageUrls.length,
    onDotClicked: animateToSlide,
    effect: const WormEffect(
      dotWidth: 6,
      dotHeight: 6,
      activeDotColor: TColors.primary500,
      dotColor: Colors.grey,
    ),
  );

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
