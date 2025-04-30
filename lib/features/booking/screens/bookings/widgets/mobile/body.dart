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
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: const Center(child: BookingsBodyShimmer()),
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

        return Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " Active Bookings (${controller.getActiveBookings()})",
                  style: TTypography.label12Regular.copyWith(
                    color: TColorSystem.n200,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections / 2),
                const ExtensibleFullWidthDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: TGridLayout(
                    crossAxisCount: 1,
                    mainAxisExtent: 120,
                    itemCount: controller.userBookings.length,
                    itemBuilder:
                        (_, index) => Column(
                          children: [
                            TBookingCard(
                              actionIconColor: TColorSystem.primary500,
                              actionIcon: TImages.notificationLight,
                              onTap: () {
                                Get.toNamed(TRoutes.availabilityCheck)!.then((
                                  _,
                                ) {
                                  controller.fetchUserBookings();
                                });
                              },
                              productName:
                                  controller.userBookings[index].listing.rooms
                                      .firstWhere(
                                        (room) =>
                                            room.roomId ==
                                            controller
                                                .userBookings[index]
                                                .roomId,
                                      )
                                      .roomDescription ??
                                  controller
                                      .userBookings[index]
                                      .listing
                                      .description,
                              productInfo:
                                  controller
                                      .userBookings[index]
                                      .listing
                                      .propertyName,
                              productsSubInfo:
                                  "${controller.userBookings[index].numberOfNights} Nights",
                              date: DateFormat('dd MMM yyyy').format(
                                DateTime.parse(controller.userBookings[index].bookingStart.toString()),
                              ),

                              booking: controller.userBookings[index],
                            ),
                          ],
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
