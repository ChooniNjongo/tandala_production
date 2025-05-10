import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../features/booking/models/booking/booking.dart';
import '../../../../../features/booking/models/booking/booking_stages.dart';
import '../../../../../features/booking/models/property/room.dart';
import '../../../../../routes/routes.dart';
import '../../../../../utils/constants/color_system.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/typography.dart';
import '../../../containers/rounded_container.dart';

class TBookingCard extends StatelessWidget {
  final Booking booking;
  final String productName;
  final String productInfo;
  final String productsSubInfo;
  final String date;
  final String actionIcon;
  final Color actionIconColor;
  final void Function()? onTap;
  final void Function()? onTapMoreIcon;

  const TBookingCard({
    super.key,
    required this.productName,
    required this.productInfo,
    required this.productsSubInfo,
    this.onTap,
    required this.date,
    this.actionIcon = TImages.moreVertical,
    this.onTapMoreIcon,
    this.actionIconColor = Colors.white,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    String getRoomImage(Booking booking) {
      // Find the room that matches the roomId in the booking
      Room? room = booking.listing.rooms.firstWhereOrNull(
        (room) => room.roomId == booking.roomId,
      );

      // Return the first image if available, otherwise return a default image
      return room?.bedAndBashBoardPictures.isNotEmpty == true
          ? room!.bedAndBashBoardPictures.first
          : 'https://via.placeholder.com/150'; // Provide a placeholder if no image is found
    }

    final List<ChartData> chartData = [
      ChartData(
        'Availability',
        50,
        booking.bookingStage == BookingStage.Availability ||
                booking.bookingStage == BookingStage.Payment ||
                booking.bookingStage == BookingStage.CheckIn ||
                booking.bookingStage == BookingStage.Review ||
                booking.bookingStage == BookingStage.Completed
            ? TColorSystem.primary500
            : TColorSystem.n800,
      ),
      ChartData(
        'Payment',
        50,
        booking.bookingStage == BookingStage.Payment ||
                booking.bookingStage == BookingStage.CheckIn ||
                booking.bookingStage == BookingStage.Review ||
                booking.bookingStage == BookingStage.Completed
            ? TColorSystem.primary500
            : TColorSystem.n800,
      ),
      ChartData(
        'CheckIn',
        50,
        booking.bookingStage == BookingStage.CheckIn ||
                booking.bookingStage == BookingStage.Review ||
                booking.bookingStage == BookingStage.Completed
            ? TColorSystem.primary500
            : TColorSystem.n800,
      ),
      ChartData(
        'Review',
        50,
        booking.bookingStage == BookingStage.Completed
            ? TColorSystem.primary500
            : TColorSystem.n800,
      ),
    ];
    return TRoundedContainer(
      showBorder: true,
      borderColor:
          booking.bookingStage == BookingStage.Completed ||
                  booking.bookingStage == BookingStage.Cancelled
              ? TColorSystem.n700
              : TColorSystem.primary300,
      onTap: () {
        Get.toNamed(TRoutes.bookingRoom, arguments: booking);
      },
      padding: const EdgeInsets.symmetric( vertical: 4),
      margin: EdgeInsets.zero,
      radius: 12,
      height: 96,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Image Container
          TRoundedContainer(
            onTap: onTap,
            padding: const EdgeInsets.only(left: 8),
            margin: EdgeInsets.zero,
            radius: 4,
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              // Rounded corners for the image
              child: Image.network(
                getRoomImage(booking), // Get the correct image from the booking
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Information Card
          const SizedBox(width: 8),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Info Card
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      productName,
                      style: TTypography.h5.copyWith(
                        color:
                            booking.bookingStage == BookingStage.Completed ||
                                    booking.bookingStage ==
                                        BookingStage.Cancelled
                                ? TColorSystem.n700
                                : TColorSystem.n200,
                      ),
                    ),
                    Text(
                      productInfo,
                      style: TTypography.label12Regular.copyWith(
                        color:
                            booking.bookingStage == BookingStage.Completed ||
                                    booking.bookingStage ==
                                        BookingStage.Cancelled
                                ? TColorSystem.n700
                                : TColorSystem.n400,
                      ),
                    ),
                    Text(
                      productsSubInfo,
                      style: TTypography.label12Regular.copyWith(
                        color:
                            booking.bookingStage == BookingStage.Completed ||
                                    booking.bookingStage ==
                                        BookingStage.Cancelled
                                ? TColorSystem.n700
                                : TColorSystem.n400,
                      ),
                    ),
                    Text(
                      date,
                      style: TTypography.label12Regular.copyWith(
                        color:
                            booking.bookingStage == BookingStage.Completed ||
                                    booking.bookingStage ==
                                        BookingStage.Cancelled
                                ? TColorSystem.n700
                                : TColorSystem.n400,
                      ),
                    ),
                  ],
                ),
                // Action Button
                if (booking.bookingStage == BookingStage.Availability ||
                    booking.bookingStage == BookingStage.Payment ||
                    booking.bookingStage == BookingStage.CheckIn ||
                    booking.bookingStage == BookingStage.Review)
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: SfCircularChart(
                      series: <CircularSeries>[
                        // Renders doughnut chart
                        DoughnutSeries<ChartData, String>(
                          dataSource: chartData,
                          pointColorMapper: (ChartData data, _) => data.color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                        ),
                      ],
                    ),
                  ),

                if ((booking.bookingStage == BookingStage.Completed))
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: TColorSystem.primary500.withOpacity(0.4),
                      size: 36,
                    ),
                  ),

                if ((booking.bookingStage == BookingStage.Cancelled))
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: Icon(
                      Icons.cancel_outlined,
                      color: Colors.red.withOpacity(0.3),
                      size: 36,
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

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
