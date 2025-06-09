import 'package:cwt_ecommerce_admin_panel/features/booking/models/property/room.dart';

import '../../../../utils/constants/enums.dart';

class Listing {
  String? listingId;
  String propertyName;
  ListingCategory listingCategory;
  ListingStage listingStage;
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
  double cancellationPercent;
  String? rejectionReason;
  bool needsApproval;
  int numberOfReviews;
  int distanceFromUser;
  double highestDiscount;

  // Rooms
  List<Room> rooms;

  Listing({
    this.listingId,
    required this.propertyName,
    required this.listingCategory,
    required this.listingStage,
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
    this.rejectionReason,
    this.needsApproval = true,
    this.numberOfReviews = 0,
    required this.distanceFromUser,
    required this.highestDiscount,
    required this.rooms,
  });

  // Method to get all images
  List<String> getAllImages() {
    final allImages = <String>[];
    allImages.addAll(propertyImages);
    for (final room in rooms) {
      allImages.addAll(room.bedAndBashBoardPictures);
    }
    return allImages;
  }

  // Static method to get an empty listing
  static Listing getEmptyListing() {
    return Listing(
      listingId: null,
      propertyName: '',
      listingCategory: ListingCategory.values.first,
      listingStage: ListingStage.values.first,
      propertyType: PropertyType.values.first,
      hostName: null,
      description: '',
      summary: '',
      userId: '',
      dateTimePublished: DateTime.now(),
      businessType: Owner.values.first,
      propertyImages: [],
      listOfAmenities: [],
      area: '',
      city: '',
      latitude: 0.0,
      longitude: 0.0,
      rating: 0.0,
      startingRoomPrice: 0.0,
      hasWifi: false,
      hasSwimmingPool: false,
      hasCarPark: false,
      hasGym: false,
      hasCamping: false,
      hasWaterfront: false,
      hasBedNBreakfast: false,
      hasBoat: false,
      hasCountryside: false,
      inCity: false,
      hasBalcony: false,
      hasParty: false,
      hasCabin: false,
      hasConference: false,
      distanceFromUser: 0,
      highestDiscount: 0.0,
      rooms: [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'listingId': listingId,
      'propertyName': propertyName,
      'listingCategory': listingCategory.toString().split('.').last,
      'listingStage': listingStage.toString().split('.').last,
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
      'rejectionReason': rejectionReason,
      'needsApproval': needsApproval,
      'numberOfReviews': numberOfReviews,
      'distanceFromUser': distanceFromUser,
      'highestDiscount': highestDiscount,
      'rooms': rooms.map((room) => room.toJson()).toList(),
    };
  }

  factory Listing.fromJson(Map<String, dynamic> json) {
    return Listing(
      listingId: json['listingId'],
      propertyName: json['propertyName'],
      listingCategory: ListingCategory.values.firstWhere(
              (e) => e.toString().split('.').last == json['listingCategory']),
      listingStage: ListingStage.values.firstWhere(
              (e) => e.toString().split('.').last == json['listingStage']),
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
      hasCamping: json['hasCamping'],
      hasWaterfront: json['hasWaterfront'],
      hasBedNBreakfast: json['hasBedNBreakfast'],
      hasBoat: json['hasBoat'],
      hasCountryside: json['hasCountryside'],
      inCity: json['inCity'],
      hasBalcony: json['hasBalcony'],
      hasParty: json['hasParty'],
      hasCabin: json['hasCabin'],
      hasConference: json['hasConference'],
      cancellationPercent: json['cancellationPercent'],
      rejectionReason: json['rejectionReason'],
      needsApproval: json['needsApproval'],
      numberOfReviews: json['numberOfReviews'],
      distanceFromUser: json['distanceFromUser'],
      highestDiscount: json['highestDiscount'],
      rooms: (json['rooms'] as List<dynamic>)
          .map((roomJson) => Room.fromJson(roomJson))
          .toList(),
    );
  }
}
