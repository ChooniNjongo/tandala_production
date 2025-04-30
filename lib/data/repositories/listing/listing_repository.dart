import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../features/booking/models/property/listing.dart';
import '../../../../features/booking/models/property/listing_model.dart';
import '../../../../features/booking/models/property/property_review.dart';
import '../../../../features/booking/models/property/room.dart';
import '../../../../utils/constants/api_constants.dart';
import '../../../features/booking/models/booking/sorting_order.dart';

class PropertyRepository extends GetxController {
  static PropertyRepository get instance => Get.find();

  Future<List<ListingModel>> getFavouritePropertiesFromAPI({
    required double latitude,
    required double longitude,
    required List<String> propertyIds,
  }) async {
    final String apiUrl =
        '${APIConstants.baseUrl}/property/favouriteProducts?param1=$latitude&param2=$longitude';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(propertyIds),
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON response
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => ListingModel.fromJson(json)).toList();
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to fetch favourite products');
      }
    } catch (e) {
      // If an error occurs during the HTTP request, throw an exception
      throw Exception('Failed to connect to the server');
    }
  }

  Future<List<ListingModel>> getCheapestProperties(
    double latitude,
    double longitude,
  ) async {
    final response = await http.get(
      Uri.parse(
        '${APIConstants.baseUrl}/property/getCheapestProperties?param1=$latitude&param2=$longitude',
      ),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON and return the list of properties
      final List<dynamic> jsonList =
          response.body.isNotEmpty ? json.decode(response.body) : [];
      return jsonList.map((json) => ListingModel.fromJson(json)).toList();
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load properties');
    }
  }

  Future<List<ListingModel>> getUserListings(
    double latitude,
    double longitude,
    String userId,
  ) async {
    final Uri uri = Uri.parse(
      '${APIConstants.baseUrl}/property/userListings',
    ).replace(
      queryParameters: {
        'param1': latitude.toString(),
        'param2': longitude.toString(),
        'userId': userId,
      },
    );

    final response = await http.post(uri);
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON and return the list of properties
      final List<dynamic> jsonList =
          response.body.isNotEmpty ? json.decode(response.body) : [];
      return jsonList.map((json) => ListingModel.fromJson(json)).toList();
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load user properties');
    }
  }

  Future<List<ListingModel>> getListingForBooking({
    required double latitude,
    required double longitude,
    required String listingId,
  }) async {
    final Uri uri = Uri.parse(
      '${APIConstants.baseUrl}/booking/getListingForBooking',
    ).replace(
      queryParameters: {
        'listingId': listingId,
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
      },
    );

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON and return the list of properties
      final jsonList = json.decode(response.body);
      return jsonList.map((json) => ListingModel.fromJson(json));
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to get listing for booking');
    }
  }

  Future<List<Listing>> searchProperties({
    String? city,
    String? name,
    String? area,
    String? category,
    int? bathroomCount,
    int? bedRoomCount,
    int? bedCount,
    bool? isHotel,
    bool? isLodge,
    bool? isGuestHouse,
    bool? isHouse,
    bool? isCampingSite,
    bool? hasWifi,
    bool? hasAirConditioning,
    bool? hasTv,
    bool? providesBreakfast,
    bool? hasGym,
    bool? petAllowed,
    bool? smokingAllowed,
    bool? hasPool,
    double? minPrice,
    double? maxPrice,
    int page = 0,
    int size = 200,
  }) async {
    final Uri uri = Uri.parse(
      '${APIConstants.baseUrl}/property/search',
    ).replace(
      queryParameters: {
        'name': name,
        'area': area,
        'category': category,
        'bathroomCount': bathroomCount?.toString(),
        'bedRoomCount': bedRoomCount?.toString(),
        'bedCount': bedCount?.toString(),
        'hasPool': hasPool?.toString(),
        'isHotel': isHotel?.toString(),
        'isLodge': isLodge?.toString(),
        'isGuestHouse': isGuestHouse?.toString(),
        'isCampingSite': isCampingSite?.toString(),
        'hasWifi': hasWifi?.toString(),
        'hasAirConditioning': hasAirConditioning?.toString(),
        'hasTv': hasTv?.toString(),
        'providesBreakfast': providesBreakfast?.toString(),
        'hasGym': hasGym?.toString(),
        'petAllowed': petAllowed?.toString(),
        'smokingAllowed': smokingAllowed?.toString(),
        'minPrice': minPrice?.toString(),
        'maxPrice': maxPrice?.toString(),
        'city': city,
        'page': page.toString(),
        'size': size.toString(),
      },
    );

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> content = jsonResponse['content'];
      return content.map((json) => Listing.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search properties');
    }
  }

  Future<List<ListingModel>> searchListings({
    double? latitude,
    double? longitude,
    String? name,
    String? area,
    String? category,
    int? bathroomCount,
    int? bedRoomCount,
    int? bedCount,
    int? roomCount,
    bool? hasPool,
    bool? petAllowed,
    double? minPrice,
    double? maxPrice,
    String? city,
    bool? isHotel,
    bool? isLodge,
    bool? isGuestHouse,
    bool? isHouse,
    bool? isCampingSite,
    bool? hasWaterfront,
    bool? hasBoat,
    bool? hasCountryside,
    bool? inCity,
    bool? hasParty,
    bool? hasBalcony,
    bool? hasCabin,
    bool? hasConference,
    bool? hasSwimmingPool,
    bool? hasWifi,
    bool? hasAirConditioning,
    bool? hasTv,
    bool? providesBreakfast,
    bool? hasGym,
    bool? smokingAllowed,
    bool? freeCancellation,
    int page = 0,
    int size = 24,
    SortingOrder? sortingOrder,
  }) async {
    final Map<String, String> queryParams = {
      if (latitude != null) 'latitude': latitude.toString(),
      if (longitude != null) 'longitude': longitude.toString(),
      if (name != null) 'name': name,
      if (area != null) 'area': area,
      if (category != null) 'category': category,
      if (bathroomCount != null) 'bathroomCount': bathroomCount.toString(),
      if (bedRoomCount != null) 'bedRoomCount': bedRoomCount.toString(),
      if (bedCount != null) 'bedCount': bedCount.toString(),
      if (roomCount != null) 'roomCount': roomCount.toString(),
      if (hasPool != null) 'hasPool': hasPool.toString(),
      if (petAllowed != null) 'petAllowed': petAllowed.toString(),
      if (minPrice != null) 'minPrice': minPrice.toString(),
      if (maxPrice != null) 'maxPrice': maxPrice.toString(),
      if (city != null) 'city': city,
      if (isHotel != null) 'isHotel': isHotel.toString(),
      if (isLodge != null) 'isLodge': isLodge.toString(),
      if (isGuestHouse != null) 'isGuestHouse': isGuestHouse.toString(),
      if (isHouse != null) 'isHouse': isHouse.toString(),
      if (isCampingSite != null) 'isCampingSite': isCampingSite.toString(),
      if (hasWaterfront != null) 'hasWaterfront': hasWaterfront.toString(),
      if (hasBoat != null) 'hasBoat': hasBoat.toString(),
      if (hasCountryside != null) 'hasCountryside': hasCountryside.toString(),
      if (inCity != null) 'inCity': inCity.toString(),
      if (hasParty != null) 'hasParty': hasParty.toString(),
      if (hasBalcony != null) 'hasBalcony': hasBalcony.toString(),
      if (hasCabin != null) 'hasCabin': hasCabin.toString(),
      if (hasConference != null) 'hasConference': hasConference.toString(),
      if (hasSwimmingPool != null)
        'hasSwimmingPool': hasSwimmingPool.toString(),
      if (hasWifi != null) 'hasWifi': hasWifi.toString(),
      if (hasSwimmingPool != null)
        'hasSwimmingPool': hasSwimmingPool.toString(),
      if (hasAirConditioning != null)
        'hasAirConditioning': hasAirConditioning.toString(),
      if (hasTv != null) 'hasTv': hasTv.toString(),
      if (providesBreakfast != null)
        'providesBreakfast': providesBreakfast.toString(),
      if (hasGym != null) 'hasGym': hasGym.toString(),
      if (smokingAllowed != null) 'smokingAllowed': smokingAllowed.toString(),
      if (sortingOrder != null)
        'sortingOrder': sortingOrder.name, // Added sorting order
      if (freeCancellation != null)
        'freeCancellation': freeCancellation.toString(),
      'page': page.toString(),
      'size': size.toString(),
    };

    final Uri uri = Uri.parse(
      '${APIConstants.baseUrl}/listing/search',
    ).replace(queryParameters: queryParams);

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((json) => ListingModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch listings');
      }
    } catch (e) {
      throw Exception('Error occurred while fetching listings: $e');
    }
  }

  //Logic to submit property to database
  submitProperty(Listing property) async {
    final response = await http.post(
      Uri.parse('${APIConstants.baseUrl}/property'),
      // Replace with your actual API endpoint
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(property.toJson()),
    );

    if (response.statusCode == 200) {
    } else {
      // Request failed
      throw Exception('Failed to submit properties');
    }
  }

  deleteProperty(String propertyId) async {
    final response = await http.delete(
      Uri.parse(
        '${APIConstants.baseUrl}/property/delete?propertyId=$propertyId',
      ),
    );

    if (response.statusCode == 200) {
    } else {
      // Request failed
      throw Exception('Failed to deleteProperty properties');
    }
  }

  Future<List<Room>> fetchRoomsForListingId(String listingId) async {
    final response = await http.get(
      Uri.parse('${APIConstants.baseUrl}/property/room/$listingId'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((json) => Room.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load rooms');
    }
  }

  Future<List<PropertyReview>> getPropertyReviewsForListingId(
    String listingId,
  ) async {
    final response = await http.get(
      Uri.parse('${APIConstants.baseUrl}/property/property-reviews/$listingId'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((json) => PropertyReview.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load reviews');
    }
  }
}
