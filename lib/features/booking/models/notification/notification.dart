class TandalaNotification {
  final String? notificationId;
  final String userId;
  final String title;
  final String message;
  bool hasBeenDelivered;
  final DateTime time;

  TandalaNotification({
    this.notificationId,
    required this.userId,
    required this.title,
    required this.message,
    required this.hasBeenDelivered,
    required this.time,
  });

  factory TandalaNotification.fromJson(Map<String, dynamic> json) {
    return TandalaNotification(
      notificationId: json['notificationId'],
      userId: json['userId'],
      title: json['title'],
      message: json['message'],
      hasBeenDelivered: json['hasBeenDelivered'],
      time: DateTime.parse(json['time']),
    );
  }
}
