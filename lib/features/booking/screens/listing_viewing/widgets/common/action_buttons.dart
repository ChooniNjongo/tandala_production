import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
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
            backgroundColor: TColors.primaryBackground,
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
          width: TSizes.buttonWidth,
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
            child: const Text(
              "View Rooms",
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

      ],
    );
  }
}
