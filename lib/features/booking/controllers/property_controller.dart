import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../data/repositories/listing/listing_repository.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../models/booking/sorting_order.dart';
import '../models/property/listing_model.dart';
import '../models/property/property_review.dart';
import 'location_controller.dart';

class ListingsController extends GetxController {
  static ListingsController get instance => Get.find();

  final showAllNearest = false.obs;
  final isLoading = false.obs;
  final currentPage = 0.obs;
  final isLoadingViewMore = false.obs;
  final hasReachedTheLastPage = false.obs;
  final hasTappedLoadingViewMore = false.obs;
  final showLoadingViewMore = true.obs;
  final propertyRepository = Get.put(PropertyRepository());
  final userRepository = Get.put(UserRepository());
  RxList<ListingModel> listings = <ListingModel>[].obs;
  RxList<ListingModel> viewMoreListings = <ListingModel>[].obs;
  Rx<double> userLatitude = 0.0.obs;
  Rx<double> userLongitude = 0.0.obs;

  final locationController = Get.put(LocationController());

  @override
  void onInit() {
    searchListings(
      latitude: userLatitude.value,
      longitude: userLongitude.value,
    );
    super.onInit();
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
    bool? isHotel,
    bool? isLodge,
    bool? isGuestHouse,
    bool? isHouse,
    bool? isCampingSite,
    bool? hasWaterfront,
    bool? hasBoat,
    bool? hasCountryside,
    bool? inCity,
    bool? hasBalcony,
    bool? hasParty,
    bool? hasCabin,
    bool? hasWifi,
    bool? hasAirConditioning,
    bool? hasTv,
    bool? providesBreakfast,
    bool? hasSwimmingPool,
    bool? hasGym,
    bool? petAllowed,
    bool? smokingAllowed,
    bool? hasPool,
    bool? hasConference,
    double? minPrice,
    double? maxPrice,
    String? city,
    int page = 0,
    int size = 30,
    bool tapOnViewMore = false,
    SortingOrder? sortingOrder,
  }) async {
    if (kDebugMode) {
      print("Calling Search Listings function");
    }
    isLoading.value = true;

    try {
      await locationController.updateLocationStatus();

      final double? latitude =
          locationController.currentPosition.value?.latitude;
      final double? longitude =
          locationController.currentPosition.value?.longitude;

      final listingsFetched = await propertyRepository.searchListings(
        latitude: latitude,
        longitude: longitude,
        name: name,
        area: area,
        category: category,
        bathroomCount: bathroomCount,
        bedRoomCount: bedRoomCount,
        bedCount: bedCount,
        isHotel: isHotel,
        isLodge: isLodge,
        isGuestHouse: isGuestHouse,
        isHouse: isHouse,
        isCampingSite: isCampingSite,
        hasWaterfront: hasWaterfront,
        hasBoat: hasBoat,
        hasCountryside: hasCountryside,
        inCity: inCity,
        hasParty: hasParty,
        hasCabin: hasCabin,
        hasWifi: hasWifi,
        hasAirConditioning: hasAirConditioning,
        hasTv: hasTv,
        providesBreakfast: providesBreakfast,
        hasGym: hasGym,
        petAllowed: petAllowed,
        smokingAllowed: smokingAllowed,
        hasPool: hasPool,
        minPrice: minPrice,
        maxPrice: maxPrice,
        city: city,
        page: page,
        size: size,
        hasConference: hasConference,
        sortingOrder: sortingOrder,
      );

      listings.assignAll(listingsFetched);

      return listingsFetched; // ✅ Return the fetched listings
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return []; // ✅ Return an empty list in case of error
    } finally {
      if (tapOnViewMore) {
        isLoadingViewMore.value = false;
      } else {
        isLoading.value = false;
      }
    }
  }

  // This function is called when an obs variable related to search is called
  // And it then searches for listings that much those updated parameters
  void searchListingsWithRxValues() {
    // Chat GTP Pass all the arguments for this function for me please use your own values as placeholders
    searchListings();
  }

  void onViewMoreListingsPressed() {
    // Update current page being requested
    currentPage.value++;
    searchListings(
      tapOnViewMore: true,
      latitude: userLatitude.value,
      longitude: userLongitude.value,
      page: currentPage.value,
      size: 30,
    );
  }

  void fetchCheapestProperties() async {
    try {
      // Show loader while loading Products
      isLoading.value = true;
      // Fetch User Location

      await userRepository.getCurrentLocation().then((value) {
        userLatitude.value = value.latitude;
        userLongitude.value = value.longitude;
      });

      // Fetch Products
      final products = await propertyRepository.getCheapestProperties(
        userLatitude.value,
        userLongitude.value,
      );
      // Assign Products
      listings.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Stop Loader
      isLoading.value = false;
    }
  }

  Future<List<PropertyReview>> fetchReviewsForListing(String listingId) async {
    return await propertyRepository.getPropertyReviewsForListingId(listingId);
  }
}
