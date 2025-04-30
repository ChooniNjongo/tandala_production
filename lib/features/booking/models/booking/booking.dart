import '../property/listing_model.dart';
import 'booking_stages.dart';

class Booking {
  String bookingId;
  String bookieUserId;
  String listerUserId;
  ListingModel listing;
  String roomId;
  DateTime checkInDate;  // ✅ Added
  DateTime checkOutDate; // ✅ Added
  int numberOfNights;
  bool isAvailable;
  bool isComplete;
  BookingStage bookingStage;
  int bookingNights;
  DateTime bookingStart;
  double bookingAmountTotal;
  double bookingTaxFee;
  double bookingBookieFee;
  double bookingOrderTotal;
  bool hasBeenCancelled;
  bool listerHasConfirmedAvailability;
  bool isPaidFor;
  bool hasCheckedIn;
  bool bookieHasReviewProperty;
  bool canCancelBooking;

  Booking({
    required this.bookingId,
    required this.bookieUserId,
    required this.listerUserId,
    required this.listing,
    required this.roomId,
    required this.checkInDate,  // ✅ Added
    required this.checkOutDate, // ✅ Added
    required this.numberOfNights,
    this.isAvailable = false,
    this.isComplete = false,
    required this.bookingStage,
    required this.bookingNights,
    required this.bookingStart,
    required this.bookingAmountTotal,
    required this.bookingTaxFee,
    required this.bookingBookieFee,
    required this.bookingOrderTotal,
    this.hasBeenCancelled = false,
    this.listerHasConfirmedAvailability = false,
    this.isPaidFor = false,
    this.hasCheckedIn = false,
    this.bookieHasReviewProperty = false,
    this.canCancelBooking = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'bookingId': bookingId,
      'bookieUserId': bookieUserId,
      'listerUserId': listerUserId,
      'listing': listing,
      'roomId': roomId,
      'checkInDate': checkInDate.toIso8601String(),  // ✅ Added
      'checkOutDate': checkOutDate.toIso8601String(), // ✅ Added
      'numberOfNights': numberOfNights,
      'isAvailable': isAvailable,
      'isComplete': isComplete,
      'bookingStage': bookingStage.toString().split('.').last,
      'bookingNights': bookingNights,
      'bookingStart': bookingStart.toIso8601String(),
      'bookingAmountTotal': bookingAmountTotal,
      'bookingTaxFee': bookingTaxFee,
      'bookingBookieFee': bookingBookieFee,
      'bookingOrderTotal': bookingOrderTotal,
      'hasBeenCancelled': hasBeenCancelled,
      'listerHasConfirmedAvailability': listerHasConfirmedAvailability,
      'isPaidFor': isPaidFor,
      'hasCheckedIn': hasCheckedIn,
      'bookieHasReviewProperty': bookieHasReviewProperty,
      'canCancelBooking': canCancelBooking,
    };
  }

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      bookingId: json['bookingId'],
      bookieUserId: json['bookieUserId'],
      listerUserId: json['listerUserId'],
      listing: ListingModel.fromJson(json['listing']),
      roomId: json['roomId'],
      checkInDate: DateTime.parse(json['checkInDate']),  // ✅ Added
      checkOutDate: DateTime.parse(json['checkOutDate']), // ✅ Added
      numberOfNights: json['numberOfNights'],
      isAvailable: json['isAvailable'],
      isComplete: json['isComplete'],
      bookingStage: BookingStage.values.firstWhere(
              (e) => e.toString().split('.').last == json['bookingStage']),
      bookingNights: json['bookingNights'],
      bookingStart: DateTime.parse(json['bookingStart']),
      bookingAmountTotal: json['bookingAmountTotal'],
      bookingTaxFee: json['bookingTaxFee'],
      bookingBookieFee: json['bookingBookieFee'],
      bookingOrderTotal: json['bookingOrderTotal'],
      hasBeenCancelled: json['hasBeenCancelled'],
      listerHasConfirmedAvailability: json['listerHasConfirmedAvailability'],
      isPaidFor: json['isPaidFor'],
      hasCheckedIn: json['hasCheckedIn'],
      bookieHasReviewProperty: json['bookieHasReviewProperty'],
      canCancelBooking: json['canCancelBooking'],
    );
  }
}
