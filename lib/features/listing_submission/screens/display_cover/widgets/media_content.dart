import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/media_controller.dart';
import 'folder_dropdown.dart';

class MediaContent extends StatelessWidget {
  const MediaContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Media Image Header
          const SizedBox(height: TSizes.spaceBtwSections),

          /// Folders Dropdown
          Row(
            children: [
              // Folders Dropdown
              Text(
                'Select Folder',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              MediaFolderDropdown(
                onChanged: (MediaCategory? newValue) {
                  if (newValue != null) {
                    controller.selectedPath.value;
                  }
                },
              ),
            ],
          ),

          /// Show Media
          const Wrap(
            alignment: WrapAlignment.start,
            spacing: TSizes.spaceBtwItems,
            runSpacing: TSizes.spaceBtwItems,
            children: [
              TRoundedImage(
                width: 90,
                height: 90,
                padding: TSizes.sm,
                imageType: ImageType.asset,
                image: "assets/logos/Logo Horizontal copy 3.png",
                backgroundColor: TColors.primaryBackground,
              ),
              TRoundedImage(
                width: 90,
                height: 90,
                padding: TSizes.sm,
                imageType: ImageType.asset,
                image: "assets/logos/Logo Horizontal copy 3.png",
                backgroundColor: TColors.primaryBackground,
              ),
              TRoundedImage(
                width: 90,
                height: 90,
                padding: TSizes.sm,
                imageType: ImageType.asset,
                image: "assets/logos/Logo Horizontal copy 3.png",
                backgroundColor: TColors.primaryBackground,
              ),
              TRoundedImage(
                width: 90,
                height: 90,
                padding: TSizes.sm,
                imageType: ImageType.asset,
                image: "assets/logos/Logo Horizontal copy 3.png",
                backgroundColor: TColors.primaryBackground,
              ),
              TRoundedImage(
                width: 90,
                height: 90,
                padding: TSizes.sm,
                imageType: ImageType.asset,
                image: "assets/logos/Logo Horizontal copy 3.png",
                backgroundColor: Colors.transparent,
              ),
            ],
          ),

          /// Load More Media Button
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: TSizes.spaceBtwSections,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: TSizes.buttonWidth,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text('Load More'),
                    icon: const Icon(Iconsax.arrow_down),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
