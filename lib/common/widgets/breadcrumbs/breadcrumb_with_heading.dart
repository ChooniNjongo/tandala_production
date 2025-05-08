import 'package:cwt_ecommerce_admin_panel/utils/constants/color_system.dart';
import 'package:cwt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../routes/routes.dart';
import '../../../utils/constants/sizes.dart';
import '../texts/page_heading.dart';

class TBreadcrumbsWithHeading extends StatelessWidget {
  const TBreadcrumbsWithHeading({
    super.key,
    required this.breadcrumbItems,
    required this.heading,
    this.returnToPreviousScreen = false,
    this.hideBreadcrumbs = false,
  });

  // The heading for the page
  final String heading;

  // List of breadcrumb items representing the navigation path
  final List<String> breadcrumbItems;

  // Flag indicating whether to include a button to return to the previous screen
  final bool returnToPreviousScreen;

  // Hide breadcrumbs boolean
  final bool hideBreadcrumbs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Breadcrumb trail
        if (!hideBreadcrumbs)
          Row(
            children: [
              // Dashboard link
              InkWell(
                onTap: () => Get.offAllNamed(TRoutes.places),
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.xs),
                  child: Text(
                    'Places',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(fontWeightDelta: -1),
                  ),
                ),
              ),
              // Breadcrumb items
              for (int i = 0; i < breadcrumbItems.length; i++)
                Row(
                  children: [
                    const Text('/'), // Separator
                    InkWell(
                      // Last item should not be clickable
                      onTap: i == breadcrumbItems.length - 1
                          ? null
                          : () => Get.toNamed(breadcrumbItems[i]),
                      child: Padding(
                        padding: const EdgeInsets.all(TSizes.xs),
                        // Format breadcrumb item: capitalize and remove leading '/'
                        child: Text(
                          i == breadcrumbItems.length - 1
                              ? breadcrumbItems[i].capitalize.toString()
                              : capitalize(breadcrumbItems[i].substring(1)),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(fontWeightDelta: -1),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        const SizedBox(height: TSizes.sm),
        // Heading of the page
        Row(
          children: [
            if (returnToPreviousScreen)
              IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Iconsax.arrow_left,
                    color: TColorSystem.n500,
                  )),
            if (returnToPreviousScreen)
              const SizedBox(width: TSizes.spaceBtwItems),
            TPageHeading(heading: heading),
          ],
        ),
      ],
    );
  }

  // Function to capitalize the first letter of a string
  String capitalize(String s) {
    return s.isEmpty ? '' : s[0].toUpperCase() + s.substring(1);
  }
}
