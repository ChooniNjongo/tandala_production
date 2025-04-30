import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../features/booking/models/property/listing_model.dart';
import '../../../../../utils/constants/color_system.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/typography.dart';

class SmallPropertyCardMobile extends StatelessWidget {
  const SmallPropertyCardMobile({super.key, required this.property});

  final ListingModel property;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Main display and favorite icon
        Stack(children: [
          SizedBox(
            height: 136,
            width: 256,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                property.propertyImages[0],
                fit: BoxFit.fill,
              ),
            ),
          ),

          /// Favorite Icon Button with hover effect
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: property.listingId == "5" || property.listingId == "3"
                  ? SvgPicture.asset(
                      "assets/icons/custom_icons/unfavorited_heart.svg",
                      height: 24, // Increase height on hover
                    )
                  : SvgPicture.asset(
                      "assets/icons/custom_icons/favorited_heart.svg",
                      height: 24, // Increase height on hover
                    ),
              onPressed: () => {},
            ),
          ),
        ]),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        SizedBox(
          width: 256,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Property Name and city
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <InlineSpan>[
                        TextSpan(
                          text: property.propertyName,
                          style: TTypography.body12Bold.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: TColorSystem.white),
                        ),
                        TextSpan(
                          text: ", ",
                          style: TTypography.body12Bold
                              .copyWith(fontSize: 10, color: TColorSystem.white),
                        ),
                        TextSpan(
                          text: "${property.city}.",
                          style: TTypography.body12Bold
                              .copyWith(fontSize: 10, color: TColorSystem.white),
                        ),
                      ],
                    ),
                  ),
                  /// Rating
                  Row(crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Visibility(
                        visible: true,
                        child: Icon(
                          Iconsax.star4,
                          color: TColors.textSecondary,
                          size: 8,
                        ),
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems / 4,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: property.rating.toString(),
                          style: TTypography.label12Bold.copyWith(
                              fontSize: 8,
                              color: TColors.textSecondary),
                        ),
                        //   TextSpan(text: property.rating.toString() != 0.0.toString() ? property.rating.toString(): "",style: Theme.of(context).textTheme.labelMedium)
                      ])),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwItems / 2,),

              /// Distance from user
              Text(
                '${property.distanceFromUser} Kilometers away',
                style: TTypography.body12Regular.copyWith(
                  fontSize: 9,
                  color: TColors.textSecondary,
                ),
              ),

              /// Price and Rating
              RichText(
                text: TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                        text: 'Starting at',
                        style: TTypography.body12Regular
                            .copyWith(
                            fontSize: 9,
                            color: TColors.textSecondary)),
                    TextSpan(
                        text:
                            ' K${property.startingRoomPrice.toInt().toString()} ',
                        style: TTypography.h5
                            .copyWith(
                            fontSize: 10,color: TColors.textSecondary)),
                    TextSpan(
                        text: 'night',
                        style: TTypography.body12Regular
                            .copyWith(
                            fontSize: 9,color: TColors.textSecondary)),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
