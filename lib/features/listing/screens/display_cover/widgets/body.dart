import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../media/controllers/media_controller.dart';
import '../../../../media/screens/media/widgets/media_content.dart';
import '../../../../media/screens/media/widgets/media_uploader.dart';

class MainCoverBody extends StatelessWidget {
  const MainCoverBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpaceDesktop),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormNavigation(
            showLeftIcon: true,
            svgImageString: TImages.home,
            step3Text: 'Step 5: Main Display',
            initialValue: 0.1,
            targetValue: 0.5,
          ),

          /// Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Breadcrumbs
              // Toggle Images Section Button
              SizedBox(
                width: TSizes.buttonWidth * 1.5,
                child: ElevatedButton.icon(
                  onPressed: () => controller.showImagesUploaderSection.value =
                      !controller.showImagesUploaderSection.value,
                  icon: const Icon(Iconsax.cloud_add),
                  label: const Text("Upload Images"),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          /// Upload Area
          const MediaUploader(),

          /// Media
          MediaContent(),
        ],
      ),
    );
  }
}
