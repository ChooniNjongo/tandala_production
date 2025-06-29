import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform, kIsWeb;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  static LocationController get instance => Get.find();

  var currentPosition = Rxn<Position>();
  var isLocationEnabled = false.obs;



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

    // Platform-specific location settings
    late LocationSettings locationSettings;

    if (kIsWeb) {
      locationSettings = WebSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
        maximumAge: const Duration(minutes: 5),
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
        intervalDuration: const Duration(seconds: 10),
        forceLocationManager: false,
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.other,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: false,
        showBackgroundLocationIndicator: false,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
    }

    try {
      Position position =
      await Geolocator.getCurrentPosition(locationSettings: locationSettings);
      currentPosition.value = position;
      isLocationEnabled.value = true;

      print("Latitude: ${position.latitude}, Longitude: ${position.longitude}");
    } catch (e) {
      Get.snackbar("Error", "Failed to get location: $e");
    }
  }
}
