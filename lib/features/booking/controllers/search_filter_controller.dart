import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/listing/listing_repository.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/popups/loaders.dart';
import '../models/booking/sorting_order.dart';
import '../models/property/listing_model.dart';

class SearchFilterController extends GetxController {
  static SearchFilterController get instance => Get.find();

  /// Variables
  //-- Sort By Variables
  final isLoading = false.obs;
  final isPriceHighToLowSelected = false.obs;
  final isPriceLowToHighSelected = false.obs;
  final isCustomerReviewSelected = false.obs;
  final isDiscountSelected = false.obs;
  final isAllTypesSelected = true.obs;
  final isHotelSelected = false.obs;
  final isLodgeSelected = false.obs;
  final isGuestHouseSelected = false.obs;
  final isApartmentSelected = false.obs;
  RxList<ListingModel> listings = <ListingModel>[].obs;
  final propertyRepository = Get.put(PropertyRepository());
  final selectedLocation = "".obs;

  /// Important Counts
  // Bathroom count
  final anyBathroomCountSelected = true.obs;
  final oneBathroomCountSelected = false.obs;
  final twoBathroomCountSelected = false.obs;
  final threeBathroomCountSelected = false.obs;

  // Bedroom count
  final anyBedroomCountSelected = true.obs;
  final oneBedroomCountSelected = false.obs;
  final twoBedroomCountSelected = false.obs;
  final threeBedroomCountSelected = false.obs;

  // Bed count
  final anyBedCountSelected = true.obs;
  final oneBedCountSelected = false.obs;
  final twoBedCountSelected = false.obs;
  final threeBedCountSelected = false.obs;

  /// Amenities
  final hasWifi = false.obs;
  final hasSwimmingPool = false.obs;
  final hasAirConditioning = false.obs;
  final hasTV = false.obs;
  final providesBreakfast = false.obs;
  final hasGym = false.obs;

  /// Property Rules Variables
  final allowsPets = false.obs;
  final hasParty = false.obs;
  final smokingAllowed = false.obs;

  @override
  void onInit() {
    searchWithFilters();
    super.onInit();
  }

  /// Bathroom Count
  void onAnyBathroomCountSelected() {
    oneBathroomCountSelected.value = false;
    twoBathroomCountSelected.value = false;
    threeBathroomCountSelected.value = false;
    THelperFunctions.toggleObxValue(anyBathroomCountSelected);
    searchWithFilters();
  }

  void onOneBathroomCountSelected() {
    anyBathroomCountSelected.value = false;
    twoBathroomCountSelected.value = false;
    threeBathroomCountSelected.value = false;
    THelperFunctions.toggleObxValue(oneBathroomCountSelected);
    searchWithFilters();
  }

  void onTwoBathroomCountSelected() {
    anyBathroomCountSelected.value = false;
    oneBathroomCountSelected.value = false;
    threeBathroomCountSelected.value = false;
    THelperFunctions.toggleObxValue(twoBathroomCountSelected);
    searchWithFilters();
  }

  void onThreeBathroomCountSelected() {
    /***  Implement in API to filter properties with 3 or more ***/
    anyBathroomCountSelected.value = false;
    oneBathroomCountSelected.value = false;
    twoBathroomCountSelected.value = false;
    THelperFunctions.toggleObxValue(threeBathroomCountSelected);
    searchWithFilters();
  }

  /// Bedroom Count
  void onAnyBedroomCountSelected() {
    oneBedroomCountSelected.value = false;
    twoBedroomCountSelected.value = false;
    threeBedroomCountSelected.value = false;
    THelperFunctions.toggleObxValue(anyBedroomCountSelected);
    searchWithFilters();
  }

  void onOneBedroomCountSelected() {
    anyBedroomCountSelected.value = false;
    twoBedroomCountSelected.value = false;
    threeBedroomCountSelected.value = false;
    THelperFunctions.toggleObxValue(oneBedroomCountSelected);
    searchWithFilters();
  }

  void onTwoBedroomCountSelected() {
    anyBedroomCountSelected.value = false;
    oneBedroomCountSelected.value = false;
    threeBedroomCountSelected.value = false;
    THelperFunctions.toggleObxValue(twoBedroomCountSelected);
    searchWithFilters();
  }

  void onThreeBedroomCountSelected() {
    anyBedroomCountSelected.value = false;
    oneBedroomCountSelected.value = false;
    twoBedroomCountSelected.value = false;
    THelperFunctions.toggleObxValue(threeBedroomCountSelected);
    searchWithFilters();
  }

  /// Bed Count
  void onAnyBedCountSelected() {
    oneBedCountSelected.value = false;
    twoBedCountSelected.value = false;
    threeBedCountSelected.value = false;
    THelperFunctions.toggleObxValue(anyBedCountSelected);
    searchWithFilters();
  }

  void onOneBedCountSelected() {
    anyBedCountSelected.value = false;
    twoBedCountSelected.value = false;
    threeBedCountSelected.value = false;
    THelperFunctions.toggleObxValue(oneBedCountSelected);
    searchWithFilters();
  }

  void onTwoBedCountSelected() {
    anyBedCountSelected.value = false;
    oneBedCountSelected.value = false;
    threeBedCountSelected.value = false;
    THelperFunctions.toggleObxValue(twoBedCountSelected);
    searchWithFilters();
  }

  void onThreeBedCountSelected() {
    anyBedCountSelected.value = false;
    oneBedCountSelected.value = false;
    twoBedCountSelected.value = false;
    THelperFunctions.toggleObxValue(threeBedCountSelected);
    searchWithFilters();
  }

  int? getBedRoomCount() {
    String bedRoomCountBuilder = 'Any';
    int? intBedRoomCountBuilder;

    if (anyBedroomCountSelected.value) bedRoomCountBuilder = 'Any';
    if (oneBedroomCountSelected.value) bedRoomCountBuilder = '1';
    if (twoBedroomCountSelected.value) bedRoomCountBuilder = '2';
    if (threeBedroomCountSelected.value) bedRoomCountBuilder = '3';

    if (bedRoomCountBuilder != 'Any') {
      intBedRoomCountBuilder = int.tryParse(bedRoomCountBuilder);
    }

    return intBedRoomCountBuilder;
  }

  int? getBedCount() {
    String bedCountBuilder = 'Any';
    int? intBedCountBuilder;

    if (anyBedCountSelected.value) bedCountBuilder = 'Any';
    if (oneBedCountSelected.value) bedCountBuilder = '1';
    if (twoBedCountSelected.value) bedCountBuilder = '2';
    if (threeBedCountSelected.value) bedCountBuilder = '3';

    if (bedCountBuilder != 'Any') {
      intBedCountBuilder = int.tryParse(bedCountBuilder);
    }

    return intBedCountBuilder;
  }

  int? getBathroomCount() {
    String bathRoomCountBuilder = 'Any';
    int? intBathRoomCountBuilder;

    if (anyBathroomCountSelected.value) bathRoomCountBuilder = 'Any';
    if (oneBathroomCountSelected.value) bathRoomCountBuilder = '1';
    if (twoBathroomCountSelected.value) bathRoomCountBuilder = '2';
    if (threeBathroomCountSelected.value) bathRoomCountBuilder = '3';
    if (bathRoomCountBuilder != 'Any') {
      intBathRoomCountBuilder = int.tryParse(bathRoomCountBuilder);
    }

    return intBathRoomCountBuilder;
  }

  Rx<RangeValues> currentRange = const RangeValues(100, 10000).obs;

  Rx<String> initialCitiesAndTownsInZambiaDropDownValue = "Lusaka".obs;
  List<String> citiesAndTownsInZambia =
      {
        "Lusaka",
        "Kaoma",
        "Kawambwa",
        "Kitwe",
        "Livingstone",
        "Ndola",
        "Serenje",
      }.toList();

  /// Location Search
  void onLocationChanged() {
    searchWithFilters();
  }

  ///  Sort by price , discount
  void resetAllSortByFilters() {
    isPriceHighToLowSelected.value = false;
    isPriceLowToHighSelected.value = false;
    isCustomerReviewSelected.value = false;
    isDiscountSelected.value = false;
  }

  void onIsPriceHighToLowTapped() {
    resetAllSortByFilters();
    THelperFunctions.toggleObxValue(isPriceHighToLowSelected);
    searchWithFilters();
  }

  void onIsPriceLowToHighTapped() {
    resetAllSortByFilters();
    THelperFunctions.toggleObxValue(isPriceLowToHighSelected);
    searchWithFilters();
  }

  void onIsDiscountSelectedTapped() {
    resetAllSortByFilters();
    THelperFunctions.toggleObxValue(isDiscountSelected);
    searchWithFilters();
  }

  /// Property Type Search
  void resetAllTypesFilters() {
    isAllTypesSelected.value = false;
  }

  void resetAllListingTypeFilters() {
    isHotelSelected.value = false;
    isLodgeSelected.value = false;
    isGuestHouseSelected.value = false;
    isApartmentSelected.value = false;
  }

  /// Price Range Search
  // Here we can just send the max and mini straight from UI UX using Getx Controller state management

  /// Amenities Filters
  bool? getHasWifi() {
    if (hasWifi.value) return true;
    return null;
  }

  bool? getHasAirConditioning() {
    if (hasAirConditioning.value) return true;
    return null;
  }

  bool? getHasTv() {
    if (hasTV.value) return true;
    return null;
  }

  bool? getProvidesBreakfast() {
    if (providesBreakfast.value) return true;
    return null;
  }

  bool? getHasParty() {
    if (hasParty.value) return true;
    return null;
  }

  bool? getHasGym() {
    if (hasGym.value) return true;
    return null;
  }

  bool? getPetAllowed() {
    if (allowsPets.value) return true;
    return null;
  }

  bool? getSmokingAllowed() {
    if (smokingAllowed.value) return true;
    return null;
  }

  bool? getHasPool() {
    if (hasSwimmingPool.value) return true;
    return null;
  }

  /// Search with current filters
  void searchWithFilters() async {
    isLoading.value = true;
    SortingOrder? sortingOrder;

    if (isPriceHighToLowSelected.value) {
      sortingOrder = SortingOrder.highToLow;
    } else if (isPriceLowToHighSelected.value) {
      sortingOrder = SortingOrder.lowToHigh;
    } else if (isDiscountSelected.value) {
      sortingOrder = SortingOrder.discount;
    }

    final list = await propertyRepository.searchListings(
      city: selectedLocation.value.isNotEmpty ? selectedLocation.value : null,
      sortingOrder: sortingOrder, // Dynamically assigned
      isHotel: isHotelSelected.value ? true : null,
      isLodge: isLodgeSelected.value ? true : null,
      isGuestHouse: isGuestHouseSelected.value ? true : null,
      isHouse: isApartmentSelected.value ? true : null,
      maxPrice: currentRange.value.end,
      minPrice: currentRange.value.start,

      /// Important Counts
      bedCount: getBedCount(),
      bathroomCount: getBathroomCount(),
      bedRoomCount: getBedRoomCount(),

      /// Common Amenities
      hasWifi: getHasWifi(),
      hasAirConditioning: getHasAirConditioning(),
      hasTv: getHasTv(),
      providesBreakfast: getProvidesBreakfast(),
      hasGym: getHasGym(),
      hasPool: getHasPool(),

      /// Place Rules
      petAllowed: getPetAllowed(),
      smokingAllowed: getSmokingAllowed(),
      hasParty: getHasParty(),
    );

    listings.assignAll(list); // ✅ Assign the fetched listings
    isLoading.value = false;
  }

  /// Clear filters
  void Function()? clearFilter() {
    // Reset Sort By Variables
    isPriceHighToLowSelected.value = false;
    isPriceLowToHighSelected.value = false;
    isCustomerReviewSelected.value = false;
    isDiscountSelected.value = false;

    // Reset Property Types
    isAllTypesSelected.value = true;
    isHotelSelected.value = false;
    isLodgeSelected.value = false;
    isGuestHouseSelected.value = false;
    isApartmentSelected.value = false;

    // Reset Location
    selectedLocation.value = "";

    // Reset Bathroom Counts
    anyBathroomCountSelected.value = true;
    oneBathroomCountSelected.value = false;
    twoBathroomCountSelected.value = false;
    threeBathroomCountSelected.value = false;

    // Reset Bedroom Counts
    anyBedroomCountSelected.value = true;
    oneBedroomCountSelected.value = false;
    twoBedroomCountSelected.value = false;
    threeBedroomCountSelected.value = false;

    // Reset Bed Counts
    anyBedCountSelected.value = true;
    oneBedCountSelected.value = false;
    twoBedCountSelected.value = false;
    threeBedCountSelected.value = false;

    // Reset Amenities
    hasWifi.value = false;
    hasSwimmingPool.value = false;
    hasAirConditioning.value = false;
    hasTV.value = false;
    providesBreakfast.value = false;
    hasGym.value = false;

    // Reset Property Rules
    allowsPets.value = false;
    hasParty.value = false;
    smokingAllowed.value = false;

    // Reset Price Range
    currentRange.value = const RangeValues(100, 10000);

    // Apply the reset filters to update the listings
    searchWithFilters();
    return null;
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

      /// Chat GTP please assign listings to result of
      return listingsFetched; // ✅ Return the fetched listings  await propertyRepository.searchListings(
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return []; // ✅ Return an empty list in case of error
    } finally {}
  }
}
