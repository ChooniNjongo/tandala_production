import 'package:cwt_ecommerce_admin_panel/features/booking/controllers/property_controller.dart';
import 'package:get/get.dart';

class SecondaryFilterController extends GetxController {
  static SecondaryFilterController get instance => Get.find();

  /// Variables
  final hasCamping = false.obs;
  final hasWaterfront = false.obs;
  final hasSwimmingPool = false.obs;
  final hasBedNBreakfast = true.obs;
  final hasBoat = false.obs;
  final hasCountryside = false.obs;
  final inCity = false.obs;
  final hasBalcony = false.obs;
  final hasParty = false.obs;
  final hasCabin = false.obs;
  final hasConference = false.obs;

  final listingController = Get.put(ListingsController());

  void onFilterItemTapped(RxBool rxBool) {
    resetFilters();

    rxBool.value = true;
    if (hasBedNBreakfast.hashCode == rxBool.hashCode) {
      listingController.searchListings(providesBreakfast: true);
    }

    if (hasCamping.hashCode == rxBool.hashCode) {
      listingController.searchListings(isCampingSite: true);
    }

    if (hasWaterfront.hashCode == rxBool.hashCode) {
      listingController.searchListings(hasWaterfront: true);
    }

    if (hasSwimmingPool.hashCode == rxBool.hashCode) {
      listingController.searchListings(hasPool: true);
    }

    if (hasBoat.hashCode == rxBool.hashCode) {
      listingController.searchListings(hasBoat: true);
    }

    if (hasCountryside.hashCode == rxBool.hashCode) {
      listingController.searchListings(hasCountryside: true);
    }

    if (inCity.hashCode == rxBool.hashCode) {
      listingController.searchListings(inCity: true);
    }

    if (hasBalcony.hashCode == rxBool.hashCode) {
      listingController.searchListings(hasBalcony: true);
    }

    if (hasParty.hashCode == rxBool.hashCode) {
      listingController.searchListings(hasParty: true);
    }

    if (hasCabin.hashCode == rxBool.hashCode) {
      listingController.searchListings(hasCabin: true);
    }

    if (hasConference.hashCode == rxBool.hashCode) {
      listingController.searchListings(hasConference: true);
    }

    if (hasSwimmingPool.hashCode == rxBool.hashCode) {
      listingController.searchListings(hasSwimmingPool: true);
    }

    // Search for listing matching the Quick filter item selected
    // listingController.searchListings();
  }

  void resetFilters() {
    hasCamping.value = false;
    hasWaterfront.value = false;
    hasSwimmingPool.value = false;
    hasBedNBreakfast.value = false;
    hasBoat.value = false;
    hasCountryside.value = false;
    inCity.value = false;
    hasBalcony.value = false;
    hasParty.value = false;
    hasCabin.value = false;
    hasConference.value = false;
  }
}
