import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../models/property/listing_model.dart';
import '../mobile/m_room_selection_sheet.dart';

class ActionButtons extends StatelessWidget {
  final ListingModel listing;

  const ActionButtons({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);

    /// Function to show bottom sheet with room selection options in mobile
    void showRoomSelectionBottomSheet() {
      showModalBottomSheet(
        useSafeArea: true,
        barrierColor: TColors.lightGrey,
        backgroundColor: TColors.lightGrey,
        context: context,
        isScrollControlled: true,
        // Allows the sheet to expand fully
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), // Curve for the top-left corner
            topRight: Radius.circular(16), // Curve for the top-right corner
            bottomLeft: Radius.zero, // Straight bottom-left corner
            bottomRight: Radius.zero, // Straight bottom-right corner
          ),
        ),
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: MRoomSelectionSheet(listing: listing),
          );
        },
      );
    }

    /// Function to show dialog with room selection options in desktop
    void showDesktopDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: TColors.dark,
            shadowColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            content: MRoomSelectionSheet(listing: listing),
          );
        },
        barrierDismissible: true,
      );
    }

    return Row(
      children: [
        SizedBox(
          width: TDeviceUtils.isMobileScreen(context)
              ? MediaQuery.sizeOf(context).width * 0.5
              : MediaQuery.sizeOf(context).width * 0.2,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              /// Mobile onPress
              if (isMobile) {
                Get.toNamed(TRoutes.roomSelection, arguments: listing);
              }

              /// Desktop onPress
              if (!isMobile) {
                showDesktopDialog();
              }
            },
            child: Text(
              "Reserve",
              style: TTypography.label14Bold.copyWith(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        TRoundedContainer(
          borderWidth: 1,
          padding: const EdgeInsets.all(8),
          radius: 4,
          showBorder: true,
          borderColor: TColors.iconBorder,
          child: SvgPicture.asset(
            TImages.productAddToFavorites,
            height: 24,
            semanticsLabel: 'Favorites Icon',
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        TRoundedContainer(
          borderWidth: 1,
          padding: const EdgeInsets.all(8),
          radius: 4,
          showBorder: true,
          borderColor: TColors.iconBorder,
          child: SvgPicture.asset(
            TImages.productShareListing,
            height: 24,
            semanticsLabel: 'Share Icon',
          ),
        ),
      ],
    );
  }
}
