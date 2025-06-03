// Updated NameAndCityStepController
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../routes/routes.dart';
import '../../../utils/constants/enums.dart';
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
  late TextEditingController cityTextField;

  /// Form key for the login form
  final nameAndCityFormKey = GlobalKey<FormState>();

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

    // Listen to text field changes for real-time validation
    propertyNameTextEditingController.addListener(_onPropertyNameChanged);
    cityTextField.addListener(_onCityTextChanged);

    /// Watch each observable and update stepRequirementsMet accordingly
    everAll([
      propertyNameSubmitted,
      cityOrTownSubmitted,
    ], (_) => updateStepRequirementsMet());
  }

  @override
  void onClose() {
    // Remove listeners before disposing
    propertyNameTextEditingController.removeListener(_onPropertyNameChanged);
    cityTextField.removeListener(_onCityTextChanged);

    cityTextField.dispose();
    propertyNameTextEditingController.dispose();
    super.onClose();
  }

  void updateStepRequirementsMet() {
    stepRequirementsMet.value =
        propertyNameSubmitted.value && cityOrTownSubmitted.value;
  }

  // Listen to property name changes
  void _onPropertyNameChanged() {
    propertyNameSubmitted.value = propertyNameTextEditingController.text.trim().isNotEmpty;
  }

  // Listen to city text field changes
  void _onCityTextChanged() {
    final cityText = cityTextField.text.trim();
    if (cityText.isNotEmpty && isCityValid(cityText)) {
      cityOrTownSubmitted.value = true;
      selectedCity.value = cityText;
      // Clear dropdown when typing valid city
      currentCitiesAndTownsInZambiaDropDownValue.value = "";
    } else {
      // Check if dropdown has selection when text field is invalid/empty
      cityOrTownSubmitted.value = currentCitiesAndTownsInZambiaDropDownValue.value.isNotEmpty;
      if (cityText.isEmpty && currentCitiesAndTownsInZambiaDropDownValue.value.isEmpty) {
        selectedCity.value = "";
      }
    }
  }

  Future<void> addNameAndCityDetails() async {
    // Check if step requirements are met first
    if (!stepRequirementsMet.value) {
      // Show form validation to highlight required fields
      nameAndCityFormKey.currentState?.validate();
      return;
    }

    // Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }

    // Validate title and description form
    if (!nameAndCityFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();
      return;
    }

    final storage = GetStorage();
    final savedListing = Listing.fromJson(storage.read("listing"));

    // update property name
    savedListing.propertyName = propertyNameTextEditingController.text.trim();

    // update city or town
    savedListing.city = selectedCity.value.isNotEmpty
        ? selectedCity.value
        : currentCitiesAndTownsInZambiaDropDownValue.value;

    // Write the updated listing back to storage
    storage.write("listing", savedListing.toJson());

    if (kDebugMode) {
      print("Successfully updated addNameAndCityDetails");
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
    storage.write("listingStage", ListingStage.StepFour.name);
    Get.toNamed(TRoutes.description);
  }

  void onEditingComplete() {
    propertyNameSubmitted.value = propertyNameTextEditingController.text.trim().isNotEmpty;
  }

  void onCityEditingComplete() {
    // Validate if the entered city exists in the list
    final cityText = cityTextField.text.trim();
    if (citiesAndTownsInZambia.contains(cityText)) {
      cityOrTownSubmitted.value = true;
      selectedCity.value = cityText;
      currentCitiesAndTownsInZambiaDropDownValue.value = cityText;
    }
  }

  void onCitySelected() {
    if (currentCitiesAndTownsInZambiaDropDownValue.value.isNotEmpty) {
      cityOrTownSubmitted.value = true;
      selectedCity.value = currentCitiesAndTownsInZambiaDropDownValue.value;
      // Clear text field when dropdown is selected to avoid conflicts
      if (cityTextField.text.isNotEmpty) {
        cityTextField.clear();
      }
    }
  }

  // Method to check if city exists in the list
  bool isCityValid(String cityName) {
    return citiesAndTownsInZambia
        .any((city) => city.toLowerCase() == cityName.toLowerCase());
  }
}