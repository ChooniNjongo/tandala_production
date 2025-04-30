import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../features/booking/models/property/listing_model.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({
    super.key,
    required this.property,
  });

  final ListingModel property;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 310,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: property.propertyName,
                          style: TTypography.h5.copyWith(
                              color: TColorSystem.white.withOpacity(0.7) ),
                        ),
                        TextSpan(
                          text: ", ",
                          style: TTypography.h5.copyWith(
                              color: TColorSystem.white.withOpacity(0.7)),
                        ),
                        TextSpan(
                          text: "${property.city}.",
                          style: TTypography.h5.copyWith(
                              color: TColorSystem.white.withOpacity(0.7)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),

                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 12,
            ),
            Text(
              '${property.distanceFromUser} Kilometers away',
              style: TTypography.body12Regular.copyWith(
                color:  TColors.textSecondary ,
              ),
            ),
            SizedBox(
              child: Row(
                children: [
                  Text(
                    'Starting at',
                    style: TTypography.body12Regular.copyWith(
                      color:  TColors.textSecondary,
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems / 3,
                  ),
                  Text(
                    'K${property.startingRoomPrice.toInt().toString()}',
                    style: TTypography.h5.copyWith(
                      color:  TColors.textSecondary,
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems / 3,
                  ),
                  Text(
                    'night',
                    style: TTypography.body12Regular.copyWith(
                      color:  TColors.textSecondary,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        /// Rating
        Row(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: true,
              child: Icon(
                Iconsax.star4,
                color: TColors.textSecondary,
                size: 12,
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 4,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: property.rating.toString(),
                style: TTypography.label12Regular.copyWith(color: TColors.textSecondary),
              ),
              //   TextSpan(text: property.rating.toString() != 0.0.toString() ? property.rating.toString(): "",style: Theme.of(context).textTheme.labelMedium)
            ])),
          ],
        ),
      ],
    );
  }
}
