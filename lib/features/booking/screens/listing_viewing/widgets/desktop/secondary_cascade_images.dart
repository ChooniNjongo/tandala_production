import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../../../utils/listing_data/listings_data.dart';
import 'cascade_image_card.dart';

class SecondaryCascadeImages extends StatelessWidget {
  const SecondaryCascadeImages({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = TDeviceUtils.getScreenHeight();
    final screenWidth = TDeviceUtils.getScreenWidth(context);
    const widthRatio = 0.212;
    const heightRatio = 0.285;

    final imageWidth = screenWidth * widthRatio;
    final imageHeight = screenHeight * heightRatio;

    /// Functions
    /// Function to show dialog with room selection options in desktop
    void showPhotoGalleryFullScreen() {
      showDialog(
          context: context,
          builder: (context) {
            return Dialog.fullscreen(
              backgroundColor: Colors.yellow,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close)),
                  )
                ],
              ),
            );
          },
          barrierDismissible: false);
    }

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: imageWidth,
              height: imageHeight,
              child: CascadeImageCard(
                image: TTestListings.properties[0].propertyImages[0],
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            SizedBox(
              width: imageWidth,
              height: imageHeight,
              child: CascadeImageCard(
                topRightRadius: 12,
                image: TTestListings.properties[0].propertyImages[1],
              ),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            SizedBox(
              width: imageWidth,
              height: imageHeight,
              child: CascadeImageCard(
                image: TTestListings.properties[0].propertyImages[2],
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Stack(
              children: [
                SizedBox(
                  width: imageWidth,
                  height: imageHeight,
                  child: CascadeImageCard(
                    bottomRightRadius: 12,
                    image: TTestListings.properties[0].propertyImages[2],
                  ),
                ),
                Positioned(
                    bottom: 12,
                    right: 12,
                    child: TRoundedContainer(
                      onTap: () {
                        showPhotoGalleryFullScreen();
                      },
                      radius: 0,
                      backgroundColor: TColors.primary500,
                      height: 48,
                      width: 120,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                  text: "29 ",
                                  style: TTypography.label12Regular.copyWith(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 10,
                                      color: TColorSystem.white),
                                ),
                                TextSpan(
                                  text: "Photos",
                                  style: TTypography.label12Regular.copyWith(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 10,
                                      color: TColorSystem.white),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems / 4,
                          ),
                          SvgPicture.asset(
                            TImages.eye,
                            height: 28,
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ],
        ),
      ],
    );
  }
}
