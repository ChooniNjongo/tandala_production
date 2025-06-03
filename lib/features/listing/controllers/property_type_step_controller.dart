import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../routes/routes.dart';
import '../../../utils/constants/enums.dart';
import '../../booking/models/property/listing.dart';

class PropertyTypeStepController extends GetxController {
  static PropertyTypeStepController get instance => Get.find();

  final isGuestHouseSelected = false.obs;
  final isLodgeSelected = false.obs;
  final isHotelSelected = false.obs;
  final isApartmentSelected = false.obs;
  final isOtherSelected = false.obs;
  final stepRequirementsMet = false.obs;

  @override
  void onInit() {
    super.onInit();

    /// Watch each observable and update `hasSelectedAll` accordingly yeah
    everAll([
      isGuestHouseSelected,
      isLodgeSelected,
      isHotelSelected,
      isApartmentSelected,
      isOtherSelected,
    ], (_) => updateHasSelectedAll());
  }

  void updateHasSelectedAll() {
    stepRequirementsMet.value =
        isGuestHouseSelected.value ||
            isLodgeSelected.value ||
        isHotelSelected.value ||
        isApartmentSelected.value ||
        isOtherSelected.value;
  }

  /// Method to reset all to false because user can only choose one
  void resetAll() {
    isGuestHouseSelected.value = false;
    isLodgeSelected.value = false;
    isHotelSelected.value = false;
    isApartmentSelected.value = false;
    isOtherSelected.value = false;
  }

  void Function()? onGuestHouseSelected() {
    resetAll();
    isGuestHouseSelected.value = true;
    return null;
  }

  void Function()? onLodgeSelected() {
    resetAll();
    isLodgeSelected.value = true;
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
   // storage.write("listingStage", ListingStage.stepThree.name);

    // Try to read it back
    final json = storage.read("listing");
    if (json == null) return;

    final storedListing = Listing.fromJson(json);

    // Update the propertyType field based on the selected option
    if (isApartmentSelected.value) {
      storedListing.propertyType = PropertyType.Apartment;
    } else if (isHotelSelected.value) {
      storedListing.propertyType = PropertyType.Hotel;
    } else if (isGuestHouseSelected.value) {
      storedListing.propertyType = PropertyType.GuestHouse;
    }
    else if (isLodgeSelected.value) {
      storedListing.propertyType = PropertyType.Lodge;
    }
    else if (isOtherSelected.value) {
      storedListing.propertyType = PropertyType.Other;
    }

    // Write the updated listing back to storage
    storage.write("listing", storedListing.toJson());
    if (kDebugMode) {
      print("Successfully updated property type");
    }

    // Try to read it back and print
    final updatedListing = storage.read("listing");
    if (updatedListing != null) {
      if (kDebugMode) {
        print("Listing saved successfully: $updatedListing");
      }
    } else {
      if (kDebugMode) {
        print("No listing found in storage.");
      }
    }
    // Save listing stage
    storage.write("listingStage", ListingStage.StepThree.name);

    Get.offNamed(TRoutes.nameAndCity);
  }
}
