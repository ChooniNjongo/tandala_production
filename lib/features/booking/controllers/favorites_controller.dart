import 'dart:convert';
import 'package:get/get.dart';
import '../../../../utils/local_storage/storage_utility.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../data/repositories/listing/listing_repository.dart';
import '../../../data/repositories/user/temp_user_repository.dart' show UserRepository;
import '../models/property/listing_model.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  /// Variables
  final favorites = <String, bool>{}.obs;
  final userRepository = Get.put(UserRepository());
  Rx<double> userLatitude = 0.0.obs;
  Rx<double> userLongitude = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    initGetLocation();
    initFavorites();
  }

  void initGetLocation() async {
    await userRepository.getCurrentLocation().then((value) {
      userLatitude.value = value.latitude;
      userLongitude.value = value.longitude;
    });
  }

  // Method to Initialize favorites by reading from storage
  void initFavorites() {
    final json = TLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
        storedFavorites.map((key, value) => MapEntry(key, value as bool)),
      );
    }
  }

  bool isFavourite(String propertyId) {
    return favorites[propertyId] ?? false;
  }

  void toggleFavouriteProduct(String propertyId) {
    // Check if the property is already a favorite
    final isAlreadyFavorite = favorites.containsKey(propertyId);

    if (isAlreadyFavorite) {
      // If already a favorite, remove it
      favorites.remove(propertyId);
      TLoaders.customToast(
        message: 'Property has been removed from the Wishlist',
      );
    } else {
      // If not a favorite, add it
      favorites[propertyId] = true;
      TLoaders.customToast(message: 'Property has been added to the Wishlist.');
    }

    // Save the updated favorites to storage
    saveFavoritesToStorage();

    // Refresh the UI
    update();
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    TLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ListingModel>> getFavoriteProperties() async {
    return await PropertyRepository.instance.getFavouritePropertiesFromAPI(
      latitude: userLatitude.value,
      longitude: userLongitude.value,
      propertyIds: favorites.keys.toList(),
    );
  }
}
