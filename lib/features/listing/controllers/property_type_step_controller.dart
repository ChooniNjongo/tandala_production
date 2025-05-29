import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../booking/models/property/listing.dart';
import '../../booking/models/property/property_type.dart';
import '../models/listing_stage.dart';

class PropertyTypeStepController extends GetxController {
  static PropertyTypeStepController get instance => Get.find();

  final isLodgeOrGuestHouseSelected = false.obs;
  final isHotelSelected = false.obs;
  final isApartmentSelected = false.obs;
  final isOtherSelected = false.obs;
  final stepRequirementsMet = false.obs;

  @override
  void onInit() {
    super.onInit();

    /// Watch each observable and update `hasSelectedAll` accordingly yeah
    everAll([
      isLodgeOrGuestHouseSelected,
      isHotelSelected,
      isApartmentSelected,
      isOtherSelected,
    ], (_) => updateHasSelectedAll());
  }

  void updateHasSelectedAll() {
    stepRequirementsMet.value =
        isLodgeOrGuestHouseSelected.value ||
        isHotelSelected.value ||
        isApartmentSelected.value ||
        isOtherSelected.value;
  }

  /// Method to reset all to false because user can only choose one
  void resetAll() {
    isLodgeOrGuestHouseSelected.value = false;
    isHotelSelected.value = false;
    isApartmentSelected.value = false;
    isOtherSelected.value = false;
  }

  void Function()? onLodgeOrGuestHouseSelected() {
    resetAll();
    isLodgeOrGuestHouseSelected.value = true;
    return null;
  }

  void Function()? onHotelSelected() {
    resetAll();
    isHotelSelected.value = true;
    return null;
  }

  void Function()? onApartmentSelected() {
    resetAll();
    isApartmentSelected.value = true;
    return null;
  }

  void Function()? onOtherSelected() {
    resetAll();
    isOtherSelected.value = true;
    return null;
  }

  void selectPropertyType() {
    final storage = GetStorage();

    // Save listing stage
    storage.write("listingStage", ListingStage.stepThree.name);

    // Try to read it back
    final json = storage.read("listing");
    if (json == null) return;

    final storedListing = Listing.fromJson(json);

    // Update the propertyType field based on the selected option
    if (isApartmentSelected.value) {
      storedListing.propertyType = PropertyType.Apartment;
    } else if (isHotelSelected.value) {
      storedListing.propertyType = PropertyType.Hotel;
    } else if (isLodgeOrGuestHouseSelected.value) {
      storedListing.propertyType = PropertyType.LodgeOrGuestHouse;
    } else if (isOtherSelected.value) {
      storedListing.propertyType = PropertyType.Other;
    }

    // Write the updated listing back to storage
    storage.write("listing", storedListing.toJson());
    if (kDebugMode) {
      print("Successfully updated property type");
    }
    // Deserialize again to confirm it's stored properly
    final savedListing = Listing.fromJson(storage.read("listing"));
    if (kDebugMode) {
      print(savedListing);
    }
  }
}
