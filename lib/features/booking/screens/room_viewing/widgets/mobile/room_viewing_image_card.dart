import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../models/property/room.dart';

class RoomViewingImageCard extends StatefulWidget {
  final Room room;

  const RoomViewingImageCard({super.key, required this.room});

  @override
  State<RoomViewingImageCard> createState() => _RoomViewingImageCardState();
}

class _RoomViewingImageCardState extends State<RoomViewingImageCard> {
  final controller = CarouselSliderController();
  int activeIndex = 0;
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    imageUrls = widget.room.bedAndBashBoardPictures;
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final double carouselHeight = screenHeight * 0.33;
    const double iconSize = 32;
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
    );
  }
}
