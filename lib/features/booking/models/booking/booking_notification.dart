
class BookingNotification {
  final String? notificationId;
  final String userId;
  final String title;
  final String message;
  bool hasBeenDelivered;
  final DateTime time;
  final String bookingId;

  BookingNotification({
    this.notificationId,
    required this.userId,
    required this.title,
    required this.message,
    this.hasBeenDelivered = false,
    required this.time,
    required this.bookingId,
  });

  /// Converts a JSON map into a BookingNotification instance
  factory BookingNotification.fromJson(Map<String, dynamic> json) {
    return BookingNotification(
      notificationId: json['notificationId'] as String?,
      userId: json['userId'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      hasBeenDelivered: json['hasBeenDelivered'] as bool? ?? false,
      time: DateTime.parse(json['time'] as String),
      bookingId: json['bookingId'] as String,
    );
  }

  /// Converts the BookingNotification instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'notificationId': notificationId,
      'userId': userId,
      'title': title,
      'message': message,
      'hasBeenDelivered': hasBeenDelivered,
      'time': time.toIso8601String(),
      'bookingId': bookingId,
    };
  }
}
