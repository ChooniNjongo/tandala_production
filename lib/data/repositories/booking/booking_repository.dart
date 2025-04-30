import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../features/booking/models/booking/booking.dart';
import '../../../../features/booking/models/booking/booking_request.dart';
import '../../../../features/booking/models/booking/payment.dart';
import '../../../../features/booking/models/property/property_review.dart';
import '../../../../utils/constants/api_constants.dart';

class BookingRepository extends GetxController {
  static BookingRepository get instance => Get.find();

  //Logic to submit bookingRequest to database
  Future<void> submitBookingRequest(BookingRequest bookingRequest) async {
    final response = await http.post(
      Uri.parse('${APIConstants.baseUrl}/booking'),
      // Replace with your actual API endpoint
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(bookingRequest.toJson()),
    );

    if (response.statusCode == 200) {
    } else {
      // Request failed
      throw Exception('Failed to submit bookingRequest');
    }
  }

  Future<Booking> confirmAvailability({
    required String bookingId,
    required bool isAvailable,
  }) async {
    final response = await http.post(
      Uri.parse(
        '${APIConstants.baseUrl}/booking/confirm-availability?bookingId=$bookingId&isAvailable=$isAvailable',
      ),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData is Map<String, dynamic>) {
        return Booking.fromJson(responseData);
      } else {
        throw Exception('Invalid JSON structure');
      }
    } else {
      throw Exception(
        'Failed to load confirmAvailability: ${response.statusCode}',
      );
    }
  }

  Future<Booking> payForBooking(Payment payment) async {
    final response = await http.post(
      Uri.parse('${APIConstants.baseUrl}/booking/pay'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(payment.toJson()),
    );

    if (response.statusCode == 200) {
      return Booking.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to pay for booking: ${response.statusCode}');
    }
  }

  reviewProperty(PropertyReview propertyReview) async {
    final response = await http.post(
      Uri.parse('${APIConstants.baseUrl}/booking/review'),
      // Replace with your actual API endpoint
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(propertyReview.toJson()),
    );

    if (response.statusCode == 200) {
    } else {
      // Request failed
      throw Exception('Failed to submit reviewProperty');
    }
  }

  Future<List<Booking>> getUserBookings(String userId) async {
    if (kDebugMode) {
      print(userId);
    }
    final response = await http.get(
      Uri.parse(
        '${APIConstants.baseUrl}/booking/get-bookings-for-user/$userId',
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      return responseData.map((json) => Booking.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load user getUserBookings');
    }
  }

  Future<Booking> checkIn(String bookingId) async {
    final response = await http.post(
      Uri.parse('${APIConstants.baseUrl}/booking/check-in/$bookingId'),
    );

    if (response.statusCode == 200) {
      return Booking.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to check in bookie');
    }
  }

  Future<void> cancelBooking(String bookingId) async {
    final response = await http.post(
      Uri.parse('${APIConstants.baseUrl}/booking/cancel-booking/$bookingId'),
    );

    if (response.statusCode == 200) {

    } else {
      throw Exception('Failed to cancel booking. Try again');
    }
  }

  getUserBookingsNotifications(String uid) {}
}
