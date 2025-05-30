// Updated NameAndCityStepController
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../booking/models/property/listing.dart';

class NameAndCityStepController extends GetxController {
  static NameAndCityStepController get instance => Get.find();

  final propertyNameSubmitted = false.obs;
  final cityOrTownSubmitted = false.obs;
  final stepRequirementsMet = false.obs;
  final cityOrTown = "".obs;

  Rx<String> currentCitiesAndTownsInZambiaDropDownValue = "".obs;
  Rx<String> selectedCity = "".obs;

  final propertyNameTextEditingController = TextEditingController();
  final propertyNameFormKey = GlobalKey<FormState>();
  late TextEditingController cityTextField;

  List<String> citiesAndTownsInZambia = [
    "Chipata",
    "Choma",
    "Isoka",
    "Kabwe",
    "Kalabo",
    "Kalulushi",
    "Kasama",
    "Kafue",
    "Kaoma",
    "Kawambwa",
    "Kitwe",
    "Livingstone",
    "Lusaka",
    "Luanshya",
    "Lundazi",
    "Mansa",
    "Mazabuka",
    "Mbala",
    "Mkushi",
    "Monze",
    "Mongu",
    "Mpika",
    "Mpongwe",
    "Mpulungu",
    "Mufulira",
    "Nakonde",
    "Ndola",
    "Serenje",
    "Samfya",
    "Nchelenge",
    "Petauke",
    "Sesheke",
    "Siavonga",
    "Sioma",
    "Solwezi",
    "Zambezi",
  ];

  @override
  void onInit() {
    super.onInit();
    cityTextField = TextEditingController();

    /// Watch each observable and update stepRequirementsMet accordingly
    everAll([
      propertyNameSubmitted,
      cityOrTownSubmitted,
    ], (_) => updateStepRequirementsMet());
  }

  @override
  void onClose() {
    cityTextField.dispose();
    propertyNameTextEditingController.dispose();
    super.onClose();
  }

  void updateStepRequirementsMet() {
    stepRequirementsMet.value = propertyNameSubmitted.value && cityOrTownSubmitted.value;
  }

  Future<void> addNameAndCityDetails() async {


    // Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }

    // Validate title and description form
    if (!propertyNameFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();
      return;
    }
    final storage = GetStorage();
    final savedListing = Listing.fromJson(storage.read("listing"));
    // update property name
    savedListing.propertyName = propertyNameTextEditingController.text;
    // update city or town
    savedListing.city = selectedCity.value.isNotEmpty
        ? selectedCity.value
        : currentCitiesAndTownsInZambiaDropDownValue.value;
    // Write the updated listing back to storage
    storage.write("listing", savedListing.toJson());
    if (kDebugMode) {
      print("Successfully updated addNameAndCityDetails");
    }
    // Deserialize again to confirm it's stored properly
    final storedListing = storage.read("listing");
    if (kDebugMode) {
      print(storedListing);
    }

    // Save listing stage
    //storage.write("listingStage", ListingStage.stepFour.name);
  }

  void onEditingComplete() {
    propertyNameSubmitted.value = true;
  }

  void onCityEditingComplete() {
    // Validate if the entered city exists in the list
    if (citiesAndTownsInZambia.contains(cityTextField.text)) {
      cityOrTownSubmitted.value = true;
      selectedCity.value = cityTextField.text;
      currentCitiesAndTownsInZambiaDropDownValue.value = cityTextField.text;
    }
  }

  void onCitySelected() {
    cityOrTownSubmitted.value = true;
  }

  // Method to check if city exists in the list
  bool isCityValid(String cityName) {
    return citiesAndTownsInZambia.any((city) =>
    city.toLowerCase() == cityName.toLowerCase());
  }
}