import 'package:cwt_ecommerce_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/repositories/listing/listing_repository.dart';
import '../../../routes/routes.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/popups/loaders.dart';
import '../../booking/models/property/listing.dart';

class ListingProcessController extends GetxController {
  static ListingProcessController get instance => Get.find();

  final isLoading = false.obs;
  final propertyRepository = Get.put(PropertyRepository());
  RxList<Listing> listings = <Listing>[].obs;

  Future<List<Listing>> getUserListings() async {
    if (kDebugMode) {
      print("Fetching user listings");
    }
    isLoading.value = true;

    try {
      final listingsFetched = await propertyRepository.getUserDraftListings(
          AuthenticationRepository.instance.authUser!.uid);

      listings.assignAll(listingsFetched);

      // Navigate based on listing stage
      if (listingsFetched.isNotEmpty) {
        // Since list can only have one item when not empty, get the first item
        final listing = listingsFetched.first;
        _navigateBasedOnListingStage(listing);
      } else {
        // If listings is empty, navigate to step 1 to start new listing
        Get.toNamed(TRoutes.listingStage);
      }

      return listingsFetched;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    } finally {
      isLoading.value = false;
    }
  }

  void _navigateBasedOnListingStage(Listing listing) {
    switch (listing.listingStage) {
      case ListingStage.StepOne:
        Get.toNamed(TRoutes.checklist);
        break;
      case ListingStage.StepTwo:
        Get.toNamed(TRoutes.propertyType);
        break;
      case ListingStage.StepThree:
        Get.toNamed(TRoutes.nameAndCity);
        break;
      case ListingStage.StepFour:
        Get.toNamed(TRoutes.description);
        break;
      case ListingStage.StepFive:
        Get.toNamed(TRoutes.amenities);
        break;
      case ListingStage.StepSix:
        Get.toNamed(TRoutes.amenities);
        break;
      case ListingStage.StepSeven:
        Get.toNamed(TRoutes.amenities);
        break;
      case ListingStage.StepEight:
        Get.toNamed(TRoutes.amenities);
        break;
      case ListingStage.StepNine:
        Get.toNamed(TRoutes.amenities);
        break;
      case ListingStage.StepTen:
        Get.toNamed(TRoutes.amenities);
        break;
      case ListingStage.StepEleven:
        Get.toNamed(TRoutes.amenities);
        break;
      case ListingStage.StepTwelve:
        Get.toNamed(TRoutes.amenities);
        break;
      // Navigate to listing step screen for incomplete listings
        Get.toNamed('/listing-steps', arguments: listing);
        break;

      case ListingStage.Approved:
        Get.toNamed(TRoutes.amenities);
        break;
      case ListingStage.Rejected:
        Get.toNamed(TRoutes.amenities);
        break;

      }
  }

  // Optional: Method to get current listing stage as a readable string
  String getListingStageText(ListingStage stage) {
    switch (stage) {
      case ListingStage.StepOne:
        return 'Step 1 - Basic Information';
      case ListingStage.StepTwo:
        return 'Step 2 - Property Details';
      case ListingStage.StepThree:
        return 'Step 3 - Location';
      case ListingStage.StepFour:
        return 'Step 4 - Amenities';
      case ListingStage.StepFive:
        return 'Step 5 - Photos';
      case ListingStage.StepSix:
        return 'Step 6 - Rooms';
      case ListingStage.StepSeven:
        return 'Step 7 - Pricing';
      case ListingStage.StepEight:
        return 'Step 8 - Availability';
      case ListingStage.StepNine:
        return 'Step 9 - House Rules';
      case ListingStage.StepTen:
        return 'Step 10 - Cancellation Policy';
      case ListingStage.StepEleven:
        return 'Step 11 - Review';
      case ListingStage.StepTwelve:
        return 'Step 12 - Final Submission';
      case ListingStage.Approved:
        return 'Approved';
      case ListingStage.Rejected:
        return 'Rejected';
      }
  }

  // Optional: Method to check if listing is in progress
  bool isListingInProgress(ListingStage stage) {
    return stage != ListingStage.Approved && stage != ListingStage.Rejected;
  }
}