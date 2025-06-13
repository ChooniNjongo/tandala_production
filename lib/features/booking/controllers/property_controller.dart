import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../data/repositories/listing/listing_repository.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../models/booking/pagination_response.dart';
import '../models/booking/sorting_order.dart';
import '../models/property/listing_model.dart';
import '../models/property/property_review.dart';
import 'location_controller.dart';

class ListingsController extends GetxController {
  static ListingsController get instance => Get.find();

  // Existing observables
  final showAllNearest = false.obs;
  final isLoading = false.obs;
  final currentPage = 0.obs;
  final isLoadingViewMore = false.obs;
  final hasReachedTheLastPage = false.obs;
  final hasTappedLoadingViewMore = false.obs;
  final showLoadingViewMore = true.obs;

  // NEW: Pagination observables
  final totalPages = 1.obs;
  final totalElements = 0.obs;
  final hasNext = false.obs;
  final hasPrevious = false.obs;
  final isFirst = true.obs;
  final isLast = false.obs;

  // Repository and data
  final propertyRepository = Get.put(PropertyRepository());
  final userRepository = Get.put(UserRepository());
  RxList<ListingModel> listings = <ListingModel>[].obs;
  RxList<ListingModel> viewMoreListings = <ListingModel>[].obs;

  // Location data
  Rx<double> userLatitude = 0.0.obs;
  Rx<double> userLongitude = 0.0.obs;

  // Search parameters for re-search when paginating
  String? _lastSearchName;
  String? _lastSearchArea;
  String? _lastSearchCategory;
  int? _lastBathroomCount;
  int? _lastBedRoomCount;
  int? _lastBedCount;
  bool? _lastIsHotel;
  bool? _lastIsLodge;
  bool? _lastIsGuestHouse;
  bool? _lastIsHouse;
  bool? _lastIsCampingSite;
  bool? _lastHasWaterfront;
  bool? _lastHasBoat;
  bool? _lastHasCountryside;
  bool? _lastInCity;
  bool? _lastHasBalcony;
  bool? _lastHasParty;
  bool? _lastHasCabin;
  bool? _lastHasWifi;
  bool? _lastHasAirConditioning;
  bool? _lastHasTv;
  bool? _lastProvidesBreakfast;
  bool? _lastHasSwimmingPool;
  bool? _lastHasGym;
  bool? _lastPetAllowed;
  bool? _lastSmokingAllowed;
  bool? _lastHasPool;
  bool? _lastHasConference;
  double? _lastMinPrice;
  double? _lastMaxPrice;
  String? _lastCity;
  SortingOrder? _lastSortingOrder;

  // Constants
  final int itemsPerPage = 12;

  @override
  void onInit() {
    searchListings(
      latitude: userLatitude.value,
      longitude: userLongitude.value,
    );
    super.onInit();
  }

  // CORRECTED METHOD: Search with pagination support
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
    int? size, // CHANGED: Made nullable so we can use itemsPerPage as default
    bool tapOnViewMore = false,
    SortingOrder? sortingOrder,
  }) async {
    // ADDED: Use itemsPerPage if size is not provided
    final requestSize = size ?? itemsPerPage;

    if (kDebugMode) {
      print("Calling Search Listings function - Page: $page, Size: $requestSize");
    }

    if (tapOnViewMore) {
      isLoadingViewMore.value = true;
    } else {
      isLoading.value = true;
      // Store search parameters for pagination
      _lastSearchName = name;
      _lastSearchArea = area;
      _lastSearchCategory = category;
      _lastBathroomCount = bathroomCount;
      _lastBedRoomCount = bedRoomCount;
      _lastBedCount = bedCount;
      _lastIsHotel = isHotel;
      _lastIsLodge = isLodge;
      _lastIsGuestHouse = isGuestHouse;
      _lastIsHouse = isHouse;
      _lastIsCampingSite = isCampingSite;
      _lastHasWaterfront = hasWaterfront;
      _lastHasBoat = hasBoat;
      _lastHasCountryside = hasCountryside;
      _lastInCity = inCity;
      _lastHasBalcony = hasBalcony;
      _lastHasParty = hasParty;
      _lastHasCabin = hasCabin;
      _lastHasWifi = hasWifi;
      _lastHasAirConditioning = hasAirConditioning;
      _lastHasTv = hasTv;
      _lastProvidesBreakfast = providesBreakfast;
      _lastHasSwimmingPool = hasSwimmingPool;
      _lastHasGym = hasGym;
      _lastPetAllowed = petAllowed;
      _lastSmokingAllowed = smokingAllowed;
      _lastHasPool = hasPool;
      _lastHasConference = hasConference;
      _lastMinPrice = minPrice;
      _lastMaxPrice = maxPrice;
      _lastCity = city;
      _lastSortingOrder = sortingOrder;
    }

    try {


      // Use the new paginated method
      final paginatedResult = await propertyRepository.searchListingsWithPagination(
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
        size: requestSize, // CHANGED: Use calculated size
        hasConference: hasConference,
        sortingOrder: sortingOrder,
      );

      // Update pagination state
      _updatePaginationState(paginatedResult, page);

      if (tapOnViewMore) {
        // Append to existing listings
        listings.addAll(paginatedResult.content);
      } else {
        // Replace listings for new search
        listings.assignAll(paginatedResult.content);
      }

      return paginatedResult.content;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    } finally {
      if (tapOnViewMore) {
        isLoadingViewMore.value = false;
      } else {
        isLoading.value = false;
      }
    }
  }

  // Helper method to update pagination state
  void _updatePaginationState(PaginatedResponse paginatedResult, int page) {
    currentPage.value = page;
    totalPages.value = paginatedResult.totalPages;
    totalElements.value = paginatedResult.totalElements;
    hasNext.value = paginatedResult.hasNext;
    hasPrevious.value = paginatedResult.hasPrevious;
    isFirst.value = paginatedResult.isFirst;
    isLast.value = paginatedResult.isLast;
    hasReachedTheLastPage.value = paginatedResult.isLast;
  }

  // CORRECTED METHOD: Navigate to specific page
  Future<void> navigateToPage(int page) async {
    if (isLoading.value) return; // Prevent multiple requests

    await searchListings(
      latitude: userLatitude.value,
      longitude: userLongitude.value,
      name: _lastSearchName,
      area: _lastSearchArea,
      category: _lastSearchCategory,
      bathroomCount: _lastBathroomCount,
      bedRoomCount: _lastBedRoomCount,
      bedCount: _lastBedCount,
      isHotel: _lastIsHotel,
      isLodge: _lastIsLodge,
      isGuestHouse: _lastIsGuestHouse,
      isHouse: _lastIsHouse,
      isCampingSite: _lastIsCampingSite,
      hasWaterfront: _lastHasWaterfront,
      hasBoat: _lastHasBoat,
      hasCountryside: _lastHasCountryside,
      inCity: _lastInCity,
      hasBalcony: _lastHasBalcony,
      hasParty: _lastHasParty,
      hasCabin: _lastHasCabin,
      hasWifi: _lastHasWifi,
      hasAirConditioning: _lastHasAirConditioning,
      hasTv: _lastHasTv,
      providesBreakfast: _lastProvidesBreakfast,
      hasSwimmingPool: _lastHasSwimmingPool,
      hasGym: _lastHasGym,
      petAllowed: _lastPetAllowed,
      smokingAllowed: _lastSmokingAllowed,
      hasPool: _lastHasPool,
      hasConference: _lastHasConference,
      minPrice: _lastMinPrice,
      maxPrice: _lastMaxPrice,
      city: _lastCity,
      page: page,
      size: itemsPerPage, // ADDED: Force itemsPerPage
      sortingOrder: _lastSortingOrder,
    );
  }

  // NEW METHOD: Go to next page
  Future<void> nextPage() async {
    if (hasNext.value && !isLoading.value) {
      await navigateToPage(currentPage.value + 1);
    }
  }

  // NEW METHOD: Go to previous page
  Future<void> previousPage() async {
    if (hasPrevious.value && !isLoading.value) {
      await navigateToPage(currentPage.value - 1);
    }
  }

  // This function is called when an obs variable related to search is called
  void searchListingsWithRxValues() {
    searchListings();
  }

  // CORRECTED METHOD: Updated method for "view more" functionality
  void onViewMoreListingsPressed() {
    if (hasNext.value && !isLoadingViewMore.value) {
      searchListings(
        tapOnViewMore: true,
        latitude: userLatitude.value,
        longitude: userLongitude.value,
        name: _lastSearchName,
        area: _lastSearchArea,
        category: _lastSearchCategory,
        bathroomCount: _lastBathroomCount,
        bedRoomCount: _lastBedRoomCount,
        bedCount: _lastBedCount,
        isHotel: _lastIsHotel,
        isLodge: _lastIsLodge,
        isGuestHouse: _lastIsGuestHouse,
        isHouse: _lastIsHouse,
        isCampingSite: _lastIsCampingSite,
        hasWaterfront: _lastHasWaterfront,
        hasBoat: _lastHasBoat,
        hasCountryside: _lastHasCountryside,
        inCity: _lastInCity,
        hasBalcony: _lastHasBalcony,
        hasParty: _lastHasParty,
        hasCabin: _lastHasCabin,
        hasWifi: _lastHasWifi,
        hasAirConditioning: _lastHasAirConditioning,
        hasTv: _lastHasTv,
        providesBreakfast: _lastProvidesBreakfast,
        hasSwimmingPool: _lastHasSwimmingPool,
        hasGym: _lastHasGym,
        petAllowed: _lastPetAllowed,
        smokingAllowed: _lastSmokingAllowed,
        hasPool: _lastHasPool,
        hasConference: _lastHasConference,
        minPrice: _lastMinPrice,
        maxPrice: _lastMaxPrice,
        city: _lastCity,
        page: currentPage.value + 1,
        size: itemsPerPage, // ADDED: Force itemsPerPage
        sortingOrder: _lastSortingOrder,
      );
    }
  }

  void fetchCheapestProperties() async {
    try {
      isLoading.value = true;
      final products = await propertyRepository.getCheapestProperties(
        userLatitude.value,
        userLongitude.value,
      );
      listings.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<PropertyReview>> fetchReviewsForListing(String listingId) async {
    return await propertyRepository.getPropertyReviewsForListingId(listingId);
  }

  // Utility methods for pagination info
  String get paginationInfo {
    if (totalElements.value == 0) return "No results found";

    final start = (currentPage.value * itemsPerPage) + 1;
    final end = ((currentPage.value + 1) * itemsPerPage).clamp(0, totalElements.value);

    return "Showing $start-$end of ${totalElements.value} results";
  }

  bool get canGoToNextPage => hasNext.value && !isLoading.value;
  bool get canGoToPreviousPage => hasPrevious.value && !isLoading.value;
}