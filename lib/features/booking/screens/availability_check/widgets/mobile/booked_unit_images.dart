import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/color_system.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/typography.dart';
import '../../../../models/booking/booking.dart';
import '../../../../models/property/room.dart';
import 'body.dart';

class BookedUnitImages extends StatelessWidget {
  final Booking booking;

  const BookedUnitImages({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    // Find the room that matches the roomId in the booking
    Room? room = booking.listing.rooms.firstWhereOrNull(
      (room) => room.roomId == booking.roomId,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Image Container
        Text(
          booking.listing.propertyName,
          style: TTypography.body16Bold.copyWith(color: TColorSystem.n200),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(room!.roomDescription, style: TTypography.body12Regular),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        TRoundedContainer(
          onTap: () {
            Get.toNamed(TRoutes.listingViewing, arguments: {
              'listing': booking.listing,
              'isEditing': false // Or true, depending on your use case
            });
          },
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          radius: 4,
          height: 240,
          width: 240,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            // Rounded corners for the image
            child: Image.network(
              getRoomImage(booking), // Get the correct image from the booking
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        BookingDetailsItem(bookingDetailTitle: 'Nights', bookingDetailInfo: booking.numberOfNights.toString()),
        BookingDetailsItem(bookingDetailTitle: 'Booking Fee', bookingDetailInfo: "K ${booking.bookingAmountTotal.round()}"),
        BookingDetailsItem(bookingDetailTitle: 'Check In Date', bookingDetailInfo: booking.formattedBookingDate.toString()),
        BookingDetailsItem(bookingDetailTitle: 'Booking Id', bookingDetailInfo: booking.bookingId.toString().substring(8)),

        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}

class BookingDetailsItem extends StatelessWidget {
  final String bookingDetailTitle;
  final String bookingDetailInfo;
  const BookingDetailsItem(
      {super.key,
      required this.bookingDetailTitle,
      required this.bookingDetailInfo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Row(
        children: [
          Expanded(child: Text(bookingDetailTitle, style: TTypography.body10Bold.copyWith(color: TColorSystem.n500))),
          Expanded(
              child: Text(
                bookingDetailInfo,
            style: TTypography.body12Regular.copyWith(color: TColorSystem.n400)
          )),
        ],
      ),
    );
  }
}
