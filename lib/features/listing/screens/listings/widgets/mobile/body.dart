import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/buttons/t_text_button.dart';
import '../../../../../../common/widgets/cards/list_item_card/list_item.dart';
import '../../../../../../common/widgets/overrlay_header/overlay_header.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../../../utils/device/device_utility.dart';
import '../../../../../booking/models/booking/booking.dart';

class ListingsBody extends StatelessWidget {
  final List<Booking> bookings;

  const ListingsBody({super.key, required this.bookings});

  @override
  Widget build(BuildContext context) {
    // compulsory dialog function
    final isMobile = TDeviceUtils.isMobileScreen(context);

    void showMobileFilter() {
      showModalBottomSheet(
        backgroundColor: TColors.primaryBackground,
        useSafeArea: true,
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
            height: MediaQuery.of(context).size.height * .2,
            child: Column(
              children: [
                TTextButton(label: "View",onPressed: (){Get.toNamed(TRoutes.listingViewing);},),
                TTextButton(label: "Edit",onPressed: (){Get.toNamed(TRoutes.listingViewing,arguments: true);},),
                TTextButton(label: "Delete",onPressed: (){Get.toNamed(TRoutes.listingViewing);},),
              ],
            ),
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const OverlayHeader(
        label: "Listings",
        leftIcon: TImages.arrowLeft,
        rightIconColor: Colors.transparent,),

        Text(
            "${bookings.length} Active Listings",
            style: TTypography.label14Bold.copyWith(color: TColorSystem.n100),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          SizedBox(
            height: MediaQuery.of(context).size.height * .7,
            child: Expanded(
              child: bookings.isEmpty
                  ? Center(
                      child: Text(
                        "No active bookings.",
                        style: TTypography.label14Regular
                            .copyWith(color: TColorSystem.n300),
                      ),
                    )
                  : ListView.builder(
                      itemCount: bookings.length,
                      itemBuilder: (context, index) {
                        final booking = bookings[index];
                        return TListItemCard(
                          onTapMoreIcon: () {
                            showMobileFilter();
                          },
                          // Open a bottom sheet for user to edit,view or delete
                          actionIcon: TImages.moreVertical,
                          onTap: () {
                            Get.toNamed(TRoutes.listingViewing,
                                arguments: true); // true for is editing
                          },
                          productName: booking.listing.propertyName,
                          productInfo: booking.listing.city,
                          productsSubInfo: "",
                          price:
                              "K ${booking.bookingOrderTotal.toStringAsFixed(2)}",
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
