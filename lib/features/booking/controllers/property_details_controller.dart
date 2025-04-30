import 'package:get/get.dart';

import '../../../../utils/popups/loaders.dart';
import '../../../data/repositories/listing/listing_repository.dart';
import '../models/property/room.dart';

class PropertyDetailsController extends GetxController {
  static PropertyDetailsController get instance => Get.find();

  /// Variables
  final photoNumber = 0.obs;
  final totalPhotoNumber = 0.obs;
  final showAmenities = false.obs;
  final isLoading = false.obs;
  RxList<Room> roomList = <Room>[].obs;
  final propertyRepository = Get.put(PropertyRepository());
  /// Functions
  void Function()? toggleShowAmenities(){
    showAmenities.value = !showAmenities.value;
    return null;
  }

  /// Function to get Rooms for listing Id

  void fetchRoomsForListingId(String listingId) async {
    try {
      // Show loader while loading Products
      isLoading.value = true;
      // Fetch User Location
      // Fetch Products
      final rooms = await propertyRepository.fetchRoomsForListingId(listingId
          );
      // Assign Products
      roomList.assignAll(rooms);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Stop Loader
      isLoading.value = false;
    }
  }





}
