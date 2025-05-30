import 'package:cwt_ecommerce_admin_panel/features/booking/models/property/room.dart';

import '../../../../utils/constants/enums.dart';

class ListingModel {
  String? listingId;
  String propertyName;
  ListingCategory listingCategory;
  PropertyType propertyType;
  String? hostName;
  String description;
  String summary;
  String userId;
  DateTime dateTimePublished;
  Owner businessType;
  List<String> propertyImages;
  List<String> listOfAmenities;
  String area;
  String city;
  double latitude;
  double longitude;
  double rating;
  double startingRoomPrice;
  bool isApproved;

  // Amenities and rules
  bool hasWifi;
  bool? hasKitchen;
  bool hasSwimmingPool;
  bool hasCarPark;
  bool hasGym;
  bool hasCamping;
  bool hasWaterfront;
  bool hasBedNBreakfast;
  bool hasBoat;
  bool hasCountryside;
  bool inCity;
  bool hasBalcony;
  bool hasParty;
  bool hasCabin;
  bool hasConference;

  // Other properties
  double cancellationPercent;
  int numberOfReviews;
  double? distanceFromUser;
  double highestDiscount;
  bool needsApproval;
  String? rejectionReason;

  // Rooms
  List<Room> rooms;

  ListingModel({
    required this.listingId,
    required this.propertyName,
    required this.listingCategory,
    required this.propertyType,
    this.hostName,
    required this.description,
    required this.summary,
    required this.userId,
    required this.dateTimePublished,
    required this.businessType,
    required this.propertyImages,
    required this.listOfAmenities,
    required this.area,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.rating,
    required this.startingRoomPrice,
    this.isApproved = false,
    required this.hasWifi,
    this.hasKitchen,
    required this.hasSwimmingPool,
    required this.hasCarPark,
    required this.hasGym,
    this.hasCamping = false,
    this.hasWaterfront = false,
    this.hasBedNBreakfast = false,
    this.hasBoat = false,
    this.hasCountryside = false,
    this.inCity = false,
    this.hasBalcony = false,
    this.hasParty = false,
    this.hasCabin = false,
    this.hasConference = false,
    this.cancellationPercent = 0.0,
    required this.highestDiscount,
    this.distanceFromUser,
    required this.numberOfReviews,
    this.needsApproval = true,
    this.rejectionReason,
    required this.rooms,
  });

  // Method to get all images
  List<String> getAllImages() {
    final allImages = <String>[];
    allImages.addAll(propertyImages);
    for (final room in rooms) {
      allImages.addAll(room.bedAndBashBoardPictures);
      allImages.addAll(room.bathAndToilet);
    }
    return allImages;
  }

  Map<String, dynamic> toJson() {
    return {
      'listingId': listingId,
      'propertyName': propertyName,
      'listingCategory': listingCategory.toString().split('.').last,
      'propertyType': propertyType.toString().split('.').last,
      'hostName': hostName,
      'description': description,
      'summary': summary,
      'userId': userId,
      'dateTimePublished': dateTimePublished.toIso8601String(),
      'businessType': businessType.toString().split('.').last,
      'propertyImages': propertyImages,
      'listOfAmenities': listOfAmenities,
      'area': area,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
      'rating': rating,
      'startingRoomPrice': startingRoomPrice,
      'isApproved': isApproved,
      'hasWifi': hasWifi,
      'hasKitchen': hasKitchen,
      'hasSwimmingPool': hasSwimmingPool,
      'hasCarPark': hasCarPark,
      'hasGym': hasGym,
      'hasCamping': hasCamping,
      'hasWaterfront': hasWaterfront,
      'hasBedNBreakfast': hasBedNBreakfast,
      'hasBoat': hasBoat,
      'hasCountryside': hasCountryside,
      'inCity': inCity,
      'hasBalcony': hasBalcony,
      'hasParty': hasParty,
      'hasCabin': hasCabin,
      'hasConference': hasConference,
      'cancellationPercent': cancellationPercent,
      'distanceFromUser': distanceFromUser,
      'numberOfReviews': numberOfReviews,
      'highestDiscount': highestDiscount,
      'needsApproval': needsApproval,
      'rejectionReason': rejectionReason,
      'rooms': rooms.map((room) => room.toJson()).toList(),
    };
  }

  factory ListingModel.fromJson(Map<String, dynamic> json) {
    return ListingModel(
      listingId: json['listingId'],
      propertyName: json['propertyName'],
      listingCategory: ListingCategory.values.firstWhere(
              (e) => e.toString().split('.').last == json['listingCategory']),
      propertyType: PropertyType.values.firstWhere(
              (e) => e.toString().split('.').last == json['propertyType']),
      hostName: json['hostName'],
      description: json['description'],
      summary: json['summary'],
      userId: json['userId'],
      dateTimePublished: DateTime.parse(json['dateTimePublished']),
      businessType: Owner.values.firstWhere(
              (e) => e.toString().split('.').last == json['businessType']),
      propertyImages: List<String>.from(json['propertyImages']),
      listOfAmenities: List<String>.from(json['listOfAmenities']),
      area: json['area'],
      city: json['city'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      rating: json['rating'],
      startingRoomPrice: json['startingRoomPrice'],
      isApproved: json['isApproved'],
      hasWifi: json['hasWifi'],
      hasKitchen: json['hasKitchen'],
      hasSwimmingPool: json['hasSwimmingPool'],
      hasCarPark: json['hasCarPark'],
      hasGym: json['hasGym'],
      hasCamping: json['hasCamping'] ?? false,
      hasWaterfront: json['hasWaterfront'] ?? false,
      hasBedNBreakfast: json['hasBedNBreakfast'] ?? false,
      hasBoat: json['hasBoat'] ?? false,
      hasCountryside: json['hasCountryside'] ?? false,
      inCity: json['inCity'] ?? false,
      hasBalcony: json['hasBalcony'] ?? false,
      hasParty: json['hasParty'] ?? false,
      hasCabin: json['hasCabin'] ?? false,
      hasConference: json['hasConference'] ?? false,
      cancellationPercent: json['cancellationPercent'],
      distanceFromUser: json['distanceFromUser'],
      numberOfReviews: json['numberOfReviews'],
      highestDiscount: json['highestDiscount'],
      needsApproval: json['needsApproval'] ?? true,
      rejectionReason: json['rejectionReason'],
      rooms: (json['rooms'] as List<dynamic>)
          .map((roomJson) => Room.fromJson(roomJson))
          .toList(),
    );
  }
}
