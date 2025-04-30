import 'package:cwt_ecommerce_admin_panel/common/widgets/navigation/form_navigation/widgets/animated_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../routes/routes.dart';
import '../../../../utils/constants/color_system.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/typography.dart';

class FormNavigation extends StatelessWidget {
  const FormNavigation({
    super.key,
    this.svgImageString = TImages.menuDark,
    required this.step3Text,
    this.actionText = "Exit",
    required this.initialValue,
    required this.targetValue,
    this.showLeftIcon = false,
  });

  final String svgImageString;
  final String step3Text;
  final String actionText;
  final double initialValue;
  final double targetValue;
  final bool showLeftIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TColors.primaryBackground,
      height: 88,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (showLeftIcon)
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },

                        child: SvgPicture.asset(
                          TImages.chevronLeft, // Use passed svgImageString
                          color: TColorSystem.n200,
                        ),
                      ),
                    const SizedBox(width: 12),
                    Text(
                      step3Text, // Use passed step3Text
                      style: TTypography.label14Bold.copyWith(
                        color: TColorSystem.n100,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(TRoutes.home);
                  },
                  child: Text(
                    actionText, // Use passed exitText
                    style: TTypography.label14Regular.copyWith(
                      color: TColorSystem.n500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Progress Bar
          const SizedBox(height: 8),
          AnimatedProgressBar(
            duration: const Duration(seconds: 3),
            initialValue: initialValue, // Use passed initialValue
            targetValue: targetValue, // Use passed targetValue
          ),
        ],
      ),
    );
  }
}
