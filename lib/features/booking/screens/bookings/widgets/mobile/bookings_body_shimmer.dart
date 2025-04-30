import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../../../common/widgets/dividers/extensible_full_width_divider.dart';
import '../../../../../../common/widgets/shimmers/shimmer.dart';
import '../../../../../../utils/constants/sizes.dart';

class BookingsBodyShimmer extends StatelessWidget {
  const BookingsBodyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Active Bookings Shimmer
          const TShimmerEffect(width: 110, height: 16, radius: 4),

          const SizedBox(height: TSizes.spaceBtwSections),
          const ExtensibleFullWidthDivider(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .7,
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return const Column(
                  children: [
                    Row(
                      children: [
                        /// Booking Image Shimmer
                        TShimmerEffect(width: 80, height: 80, radius: 8),
                        SizedBox(width: TSizes.spaceBtwInputFields),

                        /// Booking Info Shimmer
                        Column(
                          children: [
                            TShimmerEffect(width: 80, height: 12, radius: 4),
                            SizedBox(height: TSizes.spaceBtwInputFields / 2),
                            TShimmerEffect(width: 80, height: 12, radius: 4),
                            SizedBox(height: TSizes.spaceBtwInputFields / 2),
                            TShimmerEffect(width: 80, height: 12, radius: 4),
                            SizedBox(height: TSizes.spaceBtwInputFields / 2),
                            TShimmerEffect(width: 80, height: 12, radius: 4),
                          ],
                        ),

                        /// Status Shimmer
                        Spacer(),
                        TShimmerEffect(width: 40, height: 40, radius: 32),
                        SizedBox(width: TSizes.spaceBtwSections),
                      ],
                    ),
                    ExtensibleFullWidthDivider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
    ;
  }
}
