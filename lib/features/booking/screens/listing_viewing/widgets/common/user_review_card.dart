import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import '../../../../../../common/widgets/cards/ratings/rating_indicator.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../common/widgets/layouts/headers/widgets/desktop/search_filter/filter_divider.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../models/property/property_review.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({
    super.key,
    required this.review,
  });

  final PropertyReview review;

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(UserController());
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return SizedBox(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(visible: isMobile, child: const FilterDivider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: TColors.avatarBackground,
                    child: Text(
                      "C",
                      style: TTypography.body16Regular
                          .copyWith(color: TColors.white),
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            review.userNameTruncated,
                            style: TTypography.label12Regular
                                .copyWith(color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                      TRatingBarIndicator(rating: review.rating.toDouble()),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            DateFormat.yMMMMd().format(DateTime.now()),
                            style: TTypography.label12Regular.copyWith(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 8),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          /// Review

          ReadMoreText(
            review.review,
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimExpandedText: ' show less',
            trimCollapsedText: ' show more',
            style: TTypography.label12Regular.copyWith(color: Colors.white),
            moreStyle: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: TColors.primary500),
            lessStyle: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.normal,
                color: TColors.primary500.withOpacity(0.4)),
          ),

          /// Company Review
          Visibility(
            visible: review.listingId == "jjj",
            child: TRoundedContainer(
              backgroundColor: TColors.darkerGrey,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          review.propertyName,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    ReadMoreText(
                      review.reviewReply,
                      trimLines: 4,
                      trimMode: TrimMode.Line,
                      trimExpandedText: ' show less',
                      trimCollapsedText: ' show more',
                      moreStyle: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: TColors.primary500),
                      lessStyle: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: TColors.primary500),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Visibility(visible: !isMobile, child: const FilterDivider()),
        ],
      ),
    );
  }
}
