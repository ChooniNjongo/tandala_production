import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constants/color_system.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/typography.dart';
import '../../../../utils/listing_data/listings_data.dart';
import '../../containers/rounded_container.dart';


class TListItemCard extends StatelessWidget {
  final String productName;
  final String productInfo;
  final String productsSubInfo;
  final String price;
  final String actionIcon;
  final Color actionIconColor;
  final void Function()? onTap;
  final void Function()? onTapMoreIcon;

  const TListItemCard({
    super.key,
    required this.productName,
    required this.productInfo,
    required this.productsSubInfo,
    this.onTap,
    required this.price,
    this.actionIcon = TImages.moreVertical,
    this.onTapMoreIcon,
    this.actionIconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: EdgeInsets.zero,
      radius: 0,
      height: 96,
      child: Row(
        children: [
          /// Image Container
          TRoundedContainer(
            onTap: onTap,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            radius: 4,
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              // Rounded corners for the image
              child: Image.asset(
                TTestListings.properties[0].propertyImages[0],
                fit:
                    BoxFit
                        .cover, // Ensure the image fits nicely within the container
              ),
            ),
          ),

          /// Information Card
          const SizedBox(width: 8),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Info Card
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      productName,
                      style: TTypography.h5.copyWith(color: TColorSystem.n200),
                    ),
                    Text(
                      productInfo,
                      style: TTypography.body12Regular.copyWith(
                        color: TColorSystem.n400,
                      ),
                    ),
                    Text(
                      productsSubInfo,
                      style: TTypography.label12Regular.copyWith(
                        color: TColorSystem.n200,
                      ),
                    ),
                    Text(
                      price,
                      style: TTypography.label14Regular.copyWith(
                        color: TColorSystem.n200,
                      ),
                    ),
                  ],
                ),
                // Action Button
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: onTapMoreIcon,
                      child: SvgPicture.asset(
                        actionIcon,
                        color: actionIconColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
