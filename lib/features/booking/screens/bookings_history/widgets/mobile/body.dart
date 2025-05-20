import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../../common/widgets/cards/property_cards/mobile/booking_card.dart';
import '../../../../../../common/widgets/dividers/extensible_full_width_divider.dart';
import '../../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../controllers/booking_controller.dart';
import 'bookings_body_shimmer.dart';

class BookingsBody extends StatelessWidget {
  const BookingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());

    return FutureBuilder(
      future: controller.fetchUserBookings(),
      builder: (context, snapshot) {
        // Show loader while fetching bookings
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(12.0),
            child: Center(child: BookingsBodyShimmer()),
          );
        }

        // Show error if any
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Failed to load bookings.",
              style: TTypography.label14Regular.copyWith(
                color: TColorSystem.n300,
              ),
            ),
          );
        }

        return Obx(
          () => Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Label
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Bookings",
                      style: TTypography.h3.copyWith(
                        color: TColorSystem.n200, // Text color from theme
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: TSizes.spaceBtwSections,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " Active Bookings (${controller.getActiveBookings()})",
                      style: TTypography.label12Regular.copyWith(
                        color: TColorSystem.n200,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(TRoutes.bookingsHistory);
                        },
                        child: Text(
                          "See Booking History",
                          style: TTypography.label12Regular
                              .copyWith(color: TColorSystem.n500),
                        ))
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwSections / 2),
                const ExtensibleFullWidthDivider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 2),
                  child: TGridLayout(
                    crossAxisCount: 1,
                    mainAxisExtent: 104,
                    itemCount: controller.userBookings.length,
                    itemBuilder: (_, index) => TBookingCard(
                      actionIconColor: TColorSystem.primary500,
                      actionIcon: TImages.notificationLight,
                      productName:
                          controller.userBookings[index].listing.propertyName,
                      productInfo: controller.userBookings[index].listing.rooms
                          .firstWhere(
                            (room) =>
                                room.roomId ==
                                controller.userBookings[index].roomId,
                          )
                          .roomDescription,
                      productsSubInfo:
                          "${controller.userBookings[index].numberOfNights} Nights",
                      date: DateFormat('dd MMM yyyy').format(
                        DateTime.parse(controller.userBookings[index].bookingStart
                            .toString()),
                      ),
                      booking: controller.userBookings[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
