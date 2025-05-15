import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';

class BookingsSummary extends StatelessWidget {
  const BookingsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Heading
        Column(
          children: [
            Row(
              children: [
                TCircularIcon(
                  icon: Iconsax.note,
                  backgroundColor: Colors.blue.withOpacity(0.1),
                  color: Colors.blue,
                  size: TSizes.md,
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
                TSectionHeading(
                    title: "Active Bookings", textColor: TColors.textSecondary),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text("45", style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),

          ],
        ),
      ],
    );
  }
}
