import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../features/booking/models/property/room.dart';
import '../../../../utils/constants/colors.dart';

class RoomDisplayImageSlider extends StatefulWidget {
  final Room room;
  final String roomSection;

  const RoomDisplayImageSlider({
    super.key,
    required this.room,
    required this.roomSection,
  });

  @override
  State<RoomDisplayImageSlider> createState() => _RoomDisplayImageSliderState();
}

class _RoomDisplayImageSliderState extends State<RoomDisplayImageSlider> {
  final controller = CarouselSliderController();
  int activeIndex = 0;
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    if (widget.roomSection == "bedAndBashBoardPictures") {
      imageUrls = widget.room.bedAndBashBoardPictures;
    }
    if (widget.roomSection == "bathAndToilet") {
      imageUrls = widget.room.bathAndToilet;
    }
    if (widget.roomSection == "otherRoomPictures") {
      imageUrls = widget.room.otherRoomPictures;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CarouselSlider.builder(
            carouselController: controller,
            options: CarouselOptions(
              autoPlayAnimationDuration: const Duration(milliseconds: 450),
              initialPage: 0,
              viewportFraction: 1,
              //enableInfiniteScroll: false,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              //enlargeCenterPage: true,
              autoPlay: false,
              height: MediaQuery.of(context).size.height * .68,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
            itemCount: imageUrls.length,
            itemBuilder: (context, index, realIdx) {
              return Container(
                  color: TColors.white,
                width: MediaQuery.of(context).size.height * .28,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(23),
                  child: Image.network(
                    imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Positioned(bottom: 23, right: 200, child: buildIndicator()),
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: imageUrls.length,
        onDotClicked: animateToSlide,
        effect: const WormEffect(
          dotWidth: 10,
          dotHeight: 5,
          activeDotColor: TColors.primary500,
          dotColor: Colors.grey,
        ),
      );

  Widget buildButtons({bool stretch = false}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 23)),
            onPressed: previous,
            child: const Icon(
              Icons.arrow_back,
              size: 23,
            ),
          ),
          stretch
              ? const Spacer()
              : const SizedBox(
                  width: 32,
                ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 23)),
            onPressed: next,
            child: const Icon(
              Icons.arrow_forward,
              size: 23,
            ),
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
