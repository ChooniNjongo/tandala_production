import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../booking/models/property/listing.dart';
import '../models/listing_stage.dart';

class AmenitiesStepController extends GetxController {
  static AmenitiesStepController get instance => Get.find();

  final stepRequirementsMet = false.obs;

  /// Views
  final isOceanSelected = false.obs;
  final isHarborSelected = false.obs;
  final isMountainSelected = false.obs;
  final isCitSkylineSelected = false.obs;

  /// Bathroom
  final isHairDryerSelected = false.obs;
  final isCleaningProductsSelected = false.obs;
  final isShampooSelected = false.obs;
  final isBodySoapSelected = false.obs;
  final isHotWaterSelected = false.obs;
  final isShowerGelSelected = false.obs;

  /// BedroomAndLaundrySection
  final isFreeWasherSelected = false.obs;
  final isFreeDryerSelected = false.obs;
  final isTowelsSelected = false.obs;
  final isBedSheetsSelected = false.obs;
  final isSoapSelected = false.obs;
  final isToiletPaperSelected = false.obs;
  final isHangersSelected = false.obs;
  final isBedLinensSelected = false.obs;
  final isExtraPillowsAndBlanketsSelected = false.obs;
  final isRoomDarkeningShadesSelected = false.obs;
  final isIronSelected = false.obs;
  final isClosetSelected = false.obs;

  /// Entertainment
  final isEthernetConnectionSelected = false.obs;
  final isNetflixSelected = false.obs;
  final isDStvSelected = false.obs;
  final isYoutubeSelected = false.obs;
  final isPrimeTVSelected = false.obs;
  final isHuluSelected = false.obs;
  final isBooksAndReadingMaterialSelected = false.obs;

  /// Heating And Cooling
  final isAirConditionerSelected = false.obs;
  final isHeatingSelected = false.obs;

  ///Home Safety
  final isSmokeAlarmSelected = false.obs;
  final isCarbonMonoxideAlarmSelected = false.obs;
  final isFireExtinguisherSelected = false.obs;
  final isFirstAidKitSelected = false.obs;

  /// Kitchen And Dining
  final isKitchenSelected = false.obs;
  final isRefrigeratorSelected = false.obs;
  final isMicrowaveSelected = false.obs;
  final isCookingBasicsSelected = false.obs;
  final isDishesAndSilverwareSelected = false.obs;
  final isFreezerSelected = false.obs;
  final isDishwasherSelected = false.obs;
  final isInductionStoveSelected = false.obs;
  final isOvenSelected = false.obs;
  final isHotWaterKettleSelected = false.obs;
  final isWineGlassesSelected = false.obs;
  final isToasterSelected = false.obs;
  final isBarbequeUtensilsSelected = false.obs;
  final isDiningTableSelected = false.obs;
  final isCoffeeSelected = false.obs;
  final isCoffeeMakerSelected = false.obs;

  /// Location Features
  final isShoppingMallNearbySelected = false.obs;
  final isTouristAttractionNearbySelected = false.obs;
  final isUniversityNearbyAttractionNearbySelected = false.obs;
  final isHospitalNearbyAttractionNearbySelected = false.obs;

  /// Outdoor
  final isBalconySelected = false.obs;
  final isOutdoorFurnitureSelected = false.obs;
  final isOutdoorDiningAreaSelected = false.obs;
  final isBBQGrillSelected = false.obs;
  final isSunLoungersSelected = false.obs;

  /// Parking And Facilities
  final isFreeParkingOnPremisesSelected = false.obs;
  final isFreeStreetParkingSelected = false.obs;
  final isPrivateOutdoorPoolSelected = false.obs;

  /// Services
  final isSmokingSelected = false.obs;
  final isCleaningAvailableDuringStaySelected = false.obs;

  /// Function that returns list of amenities that have been selected as true
  List<String> amenitiesSelected() {
    final List<String> selected = [];

    // Views
    if (isOceanSelected.value) selected.add("Ocean");
    if (isHarborSelected.value) selected.add("Harbor");
    if (isMountainSelected.value) selected.add("Mountain");
    if (isCitSkylineSelected.value) selected.add("City skyline");

    // Bathroom
    if (isHairDryerSelected.value) selected.add("Hair dryer");
    if (isCleaningProductsSelected.value) selected.add("Cleaning Products");
    if (isShampooSelected.value) selected.add("Shampoo");
    if (isBodySoapSelected.value) selected.add("Body Soap");
    if (isHotWaterSelected.value) selected.add("Hot Water");
    if (isShowerGelSelected.value) selected.add("Shower gel");

    // Bedroom and Laundry
    if (isFreeWasherSelected.value) selected.add("Free washer");
    if (isFreeDryerSelected.value) selected.add("Free dryer");
    if (isTowelsSelected.value) selected.add("Towels");
    if (isBedSheetsSelected.value) selected.add("Bed sheets");
    if (isSoapSelected.value) selected.add("Soap");
    if (isToiletPaperSelected.value) selected.add("Toilet Paper");
    if (isHangersSelected.value) selected.add("Hangers");
    if (isBedLinensSelected.value) selected.add("Bed linens");
    if (isExtraPillowsAndBlanketsSelected.value) {
      selected.add("Extra pillows and blankets");
    }
    if (isRoomDarkeningShadesSelected.value) {
      selected.add("Room darkening shades");
    }
    if (isIronSelected.value) selected.add("Iron");
    if (isClosetSelected.value) selected.add("Closet");

    // Entertainment
    if (isEthernetConnectionSelected.value) selected.add("Ethernet connection");
    if (isNetflixSelected.value) selected.add("Netflix");
    if (isDStvSelected.value) selected.add("DStv");
    if (isYoutubeSelected.value) selected.add("Youtube");
    if (isPrimeTVSelected.value) selected.add("Prime TV");
    if (isHuluSelected.value) selected.add("Hulu");
    if (isBooksAndReadingMaterialSelected.value) {
      selected.add("Books and reading material");
    }

    // Heating and Cooling
    if (isAirConditionerSelected.value) selected.add("Air conditioner");
    if (isHeatingSelected.value) selected.add("Heating");

    // Home Safety
    if (isSmokeAlarmSelected.value) selected.add("Smoke alarm");
    if (isCarbonMonoxideAlarmSelected.value) {
      selected.add("Carbon monoxide alarm");
    }
    if (isFireExtinguisherSelected.value) selected.add("Fire extinguisher");
    if (isFirstAidKitSelected.value) selected.add("First aid kit");

    // Kitchen and Dining
    if (isKitchenSelected.value) selected.add("Kitchen");
    if (isRefrigeratorSelected.value) selected.add("Refrigerator");
    if (isMicrowaveSelected.value) selected.add("Microwave");
    if (isCookingBasicsSelected.value) {
      selected.add("Cooking basics eg pots, pans, salt, pepper, etc");
    }
    if (isDishesAndSilverwareSelected.value) {
      selected.add("Dishes and silverware");
    }
    if (isFreezerSelected.value) selected.add("Freezer");
    if (isDishwasherSelected.value) selected.add("Dishwasher");
    if (isInductionStoveSelected.value) selected.add("Induction stove");
    if (isOvenSelected.value) selected.add("Oven");
    if (isHotWaterKettleSelected.value) selected.add("Hot water kettle");
    if (isCoffeeSelected.value) selected.add("Coffee maker");
    if (isWineGlassesSelected.value) selected.add("Wine glasses");
    if (isToasterSelected.value) selected.add("Toaster");
    if (isBarbequeUtensilsSelected.value) selected.add("Barbeque utensils");
    if (isDiningTableSelected.value) selected.add("Dining table");
    if (isCoffeeSelected.value) selected.add("Coffee");
    if (isCoffeeMakerSelected.value) selected.add("Coffee Maker");

    // Location Features
    if (isShoppingMallNearbySelected.value) {
      selected.add("Shopping mall nearby");
    }
    if (isTouristAttractionNearbySelected.value) {
      selected.add("Tourist attraction nearby");
    }
    if (isUniversityNearbyAttractionNearbySelected.value) {
      selected.add("University nearby");
    }
    if (isHospitalNearbyAttractionNearbySelected.value) {
      selected.add("Hospital nearby");
    }

    // Outdoor
    if (isBalconySelected.value) selected.add("Balcony");
    if (isOutdoorFurnitureSelected.value) selected.add("Outdoor furniture");
    if (isOutdoorDiningAreaSelected.value) selected.add("Outdoor dining area");
    if (isBBQGrillSelected.value) selected.add("BBQ grill");
    if (isSunLoungersSelected.value) selected.add("Sun loungers");

    // Parking and Facilities
    if (isFreeParkingOnPremisesSelected.value) {
      selected.add("Free parking on premises");
    }
    if (isFreeStreetParkingSelected.value) selected.add("Free street parking");
    if (isPrivateOutdoorPoolSelected.value) {
      selected.add("Private outdoor pool");
    }

    // Services
    if (isSmokingSelected.value) selected.add("Smoking");
    if (isCleaningAvailableDuringStaySelected.value) {
      selected.add("Cleaning available during stay");
    }

    if (kDebugMode) {
      print(selected.length);
    }
    return selected;
  }

  void addAmenities() {
    final storage = GetStorage();
    final savedListing = Listing.fromJson(storage.read("listing"));
    // update amenities
    savedListing.listOfAmenities = amenitiesSelected();
    // Write the updated listing back to storage
    storage.write("listing", savedListing.toJson());
    if (kDebugMode) {
      print("Successfully updated addNameAndCityDetails");
    }
    // Deserialize again to confirm it's stored properly
    // Try to read it back and print
    final storedListing = storage.read("listing");
    if (kDebugMode) {
      print(storedListing);
    }

    // Save listing stage
    storage.write("listingStage", ListingStage.stepSix.name);
  }
}
