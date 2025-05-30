import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../booking/models/property/listing.dart';

class ChecklistController extends GetxController {
  static ChecklistController get instance => Get.find();

  final isPropertyDetailsSelected = false.obs;
  final isPropertyPictureSelected = false.obs;
  final isPropertyLocationSelected = false.obs;
  final hasSelectedAll = false.obs;

  @override
  void onInit() {
    super.onInit();

    /// Watch each observable and update `hasSelectedAll` accordingly yeah
    everAll([
      isPropertyDetailsSelected,
      isPropertyPictureSelected,
      isPropertyLocationSelected,
    ], (_) => updateHasSelectedAll());
  }

  void updateHasSelectedAll() {
    hasSelectedAll.value =
        isPropertyDetailsSelected.value &&
        isPropertyPictureSelected.value &&
        isPropertyLocationSelected.value;
  }

  void startListing() {
    final storage = GetStorage();
    final emptyListing = Listing.getEmptyListing();

    // Save the listing
    storage.write("listing", emptyListing.toJson());

    // Try to read it back and print
    final storedListing = storage.read("listing");
    if (storedListing != null) {
      if (kDebugMode) {
        print("Listing saved successfully: $storedListing");
      }
    } else {
      if (kDebugMode) {
        print("No listing found in storage.");
      }
    }

    // Save listing stage
  }
}
