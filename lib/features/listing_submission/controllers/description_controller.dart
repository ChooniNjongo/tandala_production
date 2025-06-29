import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../booking/models/property/listing.dart';

class DescriptionStepController extends GetxController {
  static DescriptionStepController get instance => Get.find();

  final stepRequirementsMet = false.obs;
  final propertyDescriptionTextEditingController = TextEditingController();

  void addPropertyDescription() {
    final storage = GetStorage();
    final savedListing = Listing.fromJson(storage.read("listing"));
    // update property description
    savedListing.description = propertyDescriptionTextEditingController.text;
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
    //storage.write("listingStage", ListingStage.stepFive.name);
  }

  void onEditingComplete() {
    stepRequirementsMet.value = true;
  }
}
