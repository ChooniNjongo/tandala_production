class BookingRequest {
  String? bookieUserId;
  final String listingId;
  final String roomId;
  final int numberOfNights;
  final DateTime checkInDate;  // Added missing field
  final DateTime checkOutDate; // Added missing field

  BookingRequest({
    this.bookieUserId,
    required this.listingId,
    required this.roomId,
    required this.numberOfNights,
    required this.checkInDate,  // Initialize new field
    required this.checkOutDate, // Initialize new field
  });

  // Define toJson() method to serialize BookingRequest object to JSON
  Map<String, dynamic> toJson() {
    return {
      'bookieUserId': bookieUserId,
      'listingId': listingId,
      'roomId': roomId,
      'numberOfNights': numberOfNights,
      'checkInDate': checkInDate.toIso8601String(),  // Convert to string
      'checkOutDate': checkOutDate.toIso8601String(), // Convert to string
    };
  }

  // Define fromJson() method to deserialize JSON to BookingRequest object
  factory BookingRequest.fromJson(Map<String, dynamic> json) {
    return BookingRequest(
      bookieUserId: json['bookieUserId'],
      listingId: json['listingId'],
      roomId: json['roomId'],
      numberOfNights: json['numberOfNights'],
      checkInDate: DateTime.parse(json['checkInDate']),  // Parse new field
      checkOutDate: DateTime.parse(json['checkOutDate']), // Parse new field
    );
  }
}
