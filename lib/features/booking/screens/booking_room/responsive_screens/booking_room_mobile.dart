import 'package:flutter/material.dart';
import '../../../models/booking/booking.dart';
import '../../../models/booking/booking_stages.dart';
import '../../availability_check/availability_check.dart';
import '../../booking_completed/booking_completed.dart';
import '../../cancelled_booking/cancelled_booking.dart';
import '../../check_in/check_in.dart';
import '../../payment_stage/payment.dart';
import '../../review/review.dart';

class BookingRoomMobileScreen extends StatelessWidget {
  final Booking booking;

  const BookingRoomMobileScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBookingStageWidget());
  }

  Widget _buildBookingStageWidget() {
    switch (booking.bookingStage) {
      case BookingStage.Availability:
        return _buildAvailabilityWidget();
      case BookingStage.Payment:
        return _buildPaymentWidget();
      case BookingStage.CheckIn:
        return _buildCheckInWidget();
      case BookingStage.Review:
        return _buildReviewWidget();
      case BookingStage.Completed:
        return _buildCompletedWidget();
      case BookingStage.Cancelled:
        return _buildCancelledWidget();
    }
  }

  Widget _buildAvailabilityWidget() {
    return  AvailabilityCheckScreen(booking: booking,);
  }

  Widget _buildPaymentWidget() {
    return const PaymentScreen();
  }

  Widget _buildCheckInWidget() {
    return const CheckInScreen();
  }

  Widget _buildReviewWidget() {
    return const ReviewScreen();
  }

  Widget _buildCompletedWidget() {
    return const BookingCompletedScreen();
  }

  Widget _buildCancelledWidget() {
    return const CancelledBookingScreen();
  }
}
