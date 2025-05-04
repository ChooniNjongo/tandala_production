import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  static LocationController get instance => Get.find();

  var currentPosition = Rxn<Position>();
  var isLocationEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    updateLocationStatus();
  }

  Future<void> updateLocationStatus() async {
    isLocationEnabled.value = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      if (isLocationEnabled.value) {
        await getLocation(); // Fetch location on init if enabled
      }
    }
  }

  Future<void> getLocation() async {
    if (!isLocationEnabled.value) {
      Get.snackbar("Error", "Location services are disabled.");
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("Error", "Location permissions are denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Error", "Location permissions are permanently denied.");
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition();
      currentPosition.value = position;
      isLocationEnabled.value = true;

      print("Latitude: ${position.latitude}, Longitude: ${position.longitude}");
    } catch (e) {
      Get.snackbar("Error", "Failed to get location: $e");
    }
  }
}
