import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../common/widgets/ratings/progress_indicator_and_rating.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../models/property/listing_model.dart';

class RatingStarRatingBars extends StatelessWidget {
  final ListingModel listing;

  const RatingStarRatingBars({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TRoundedContainer(
          height: 80,
          width: 80,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          showBorder: true,
          borderColor: TColors.iconBorder,
          borderWidth: 1,
          child: Row(
            children: [
              SvgPicture.asset(TImages.ratingStar,
                  height: 24, semanticsLabel: 'Rating Star'),
              const SizedBox(width: TSizes.spaceBtwItems / 4),
              Text(
                listing.rating.toString(),
                style:
                    TTypography.h1.copyWith(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        const Column(
          children: [
            TRatingProgressIndicator(text: '5', value: 1.0),
            TRatingProgressIndicator(text: '4', value: 0.8),
            TRatingProgressIndicator(text: '3', value: 0.6),
            TRatingProgressIndicator(text: '2', value: 0.4),
            TRatingProgressIndicator(text: '1', value: 0.2),
          ],
        )
      ],
    );
  }
}
