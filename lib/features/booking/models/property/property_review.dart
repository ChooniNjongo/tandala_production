class PropertyReview {
  String? propertyReviewId;
  String listingId;
  String bookingId;
  String userId;
  String userNameTruncated;
  String propertyName;
  DateTime dateTime;
  double rating;
  String review;
  String reviewReply;

  PropertyReview({
     this.propertyReviewId,
    required this.listingId,
    required this.bookingId,
    required this.userId,
    required this.userNameTruncated,
    required this.propertyName,
    required this.dateTime,
    required this.rating,
    required this.review,
    required this.reviewReply,
  });

  Map<String, dynamic> toJson() {
    return {
      'propertyReviewId': propertyReviewId,
      'listingId': listingId,
      'bookingId': bookingId,
      'userId': userId,
      'userNameTruncated': userNameTruncated,
      'propertyName': propertyName,
      'dateTime': dateTime.toIso8601String(), // Convert DateTime to ISO 8601 string
      'rating': rating,
      'review': review,
      'reviewReply': reviewReply,
    };
  }


  factory PropertyReview.fromJson(Map<String, dynamic> json) {
    return PropertyReview(
      propertyReviewId: json['propertyReviewId'],
      listingId: json['listingId'],
      bookingId: json['bookingId'],
      userId: json['userId'],
      userNameTruncated: json['userNameTruncated'],
      propertyName: json['propertyName'],
      dateTime: DateTime.parse(json['dateTime']), // Parse ISO 8601 string to DateTime
      rating: json['rating'],
      review: json['review'],
      reviewReply: json['reviewReply'],
    );
  }

}
