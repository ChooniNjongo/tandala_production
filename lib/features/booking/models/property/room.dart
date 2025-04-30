import 'availability.dart';
import 'package:uuid/uuid.dart';
class Room {
  String? roomId;
  String listingId;
  List<String> bedAndBashBoardPictures;
  List<String> bathAndToilet;
  List<String> otherRoomPictures;
  String roomDescription;
  double price;
  bool isOnPromotion;
  int bedCount;
  int bathCount;
  int? guestCount;
  bool hasTv;
  bool hasAirConditioning;
  bool petAllowed;
  bool smokingAllowed;
  double promotionDiscount;
  Availability availability;

  Room(
      { this.roomId,
      required this.listingId,
      required this.bedAndBashBoardPictures,
      required this.bathAndToilet,
      required this.otherRoomPictures,
      required this.roomDescription,
      required this.price,
      required this.isOnPromotion,
      required this.bedCount,
      required this.bathCount,
      this.guestCount,
      required this.hasTv,
      required this.hasAirConditioning,
      this.petAllowed = false,
      this.smokingAllowed = false,
      this.promotionDiscount = 0.0,
      this.availability = Availability.Confirm});


  // Method to get all images in the room
  List<String> getAllImages() {
    final allImages = <String>[];
    allImages.addAll(bedAndBashBoardPictures);
    allImages.addAll(bathAndToilet);
    allImages.addAll(otherRoomPictures);
    return allImages;
  }


  // Method to convert JSON to Room object
  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      roomId: json['roomId'],
      listingId: json['listingId'],
      bedAndBashBoardPictures:
          List<String>.from(json['bedAndBashBoardPictures']),
      bathAndToilet: List<String>.from(json['bathAndToilet']),
      otherRoomPictures: List<String>.from(json['otherRoomPictures']),
      roomDescription: json['roomDescription'],
      price: json['price'].toDouble(),
      isOnPromotion: json['isOnPromotion'],
      bedCount: json['bedCount'],
      bathCount: json['bathCount'],
      guestCount: json['guestCount'],
      hasTv: json['hasTv'],
      hasAirConditioning: json['hasAirConditioning'],
      petAllowed: json['petAllowed'] ?? false,
      smokingAllowed: json['smokingAllowed'] ?? false,
      promotionDiscount: json['promotionDiscount'].toDouble(),
      availability: Availability.values.firstWhere(
          (e) => e.toString().split('.').last == json['availability']),
    );
  }

  // Method to convert Room object to JSON
  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'listingId': listingId,
      'bedAndBashBoardPictures': bedAndBashBoardPictures,
      'bathAndToilet': bathAndToilet,
      'otherRoomPictures': otherRoomPictures,
      'roomDescription': roomDescription,
      'price': price,
      'isOnPromotion': isOnPromotion,
      'bedCount': bedCount,
      'guestCount': guestCount,
      'hasTv': hasTv,
      'hasAirConditioning': hasAirConditioning,
      'petAllowed': petAllowed,
      'smokingAllowed': smokingAllowed,
      'promotionDiscount': promotionDiscount,
      'availability': availability.toString().split('.').last,
    };
  }


  static var uuid = const Uuid().v1();

  // Method to get an empty listing
  static Room getEmptyRoom() {
    return Room(
      roomId: uuid,
      listingId: '',
      bedAndBashBoardPictures: [],
      bathAndToilet: [],
      otherRoomPictures: [],
      roomDescription: '',
      price: 0.0,
      isOnPromotion: false,
      bedCount: 0,
      bathCount: 0,
      guestCount: 0,
      hasTv: false,
      hasAirConditioning: false,
      petAllowed: false,
      smokingAllowed: false,
      promotionDiscount: 0.0,
      availability: Availability.values.first,
    );
  }
}
