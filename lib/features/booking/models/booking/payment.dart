class Payment {
  String? paymentId;
  String bookingId;
  String userId;
  double bookingFee;
  double userFee;
  double taxFee;
  DateTime date;

  Payment({
    this.paymentId,
    required this.bookingId,
    required this.userId,
    required this.bookingFee,
    required this.userFee,
    required this.taxFee,
    required this.date,
  });

  // Define toJson() method to serialize Payment object to JSON
  Map<String, dynamic> toJson() {
    return {
      'paymentId': paymentId,
      'bookingId': bookingId,
      'userId': userId,
      'bookingFee': bookingFee,
      'userFee': userFee,
      'taxFee': taxFee,
      'date': date.toIso8601String(),
    };
  }

  // Define fromJson() method to deserialize JSON to Payment object
  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      paymentId: json['paymentId'],
      bookingId: json['bookingId'],
      userId: json['userId'],
      bookingFee: json['bookingFee'].toDouble(),
      userFee: json['userFee'].toDouble(),
      taxFee: json['taxFee'].toDouble(),
      date: DateTime.parse(json['date']),
    );
  }
}
