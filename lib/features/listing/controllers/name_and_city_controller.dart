import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../booking/models/property/listing.dart';
import '../models/listing_stage.dart';

class NameAndCityStepController extends GetxController {
  static NameAndCityStepController get instance => Get.find();

  final propertyNameSubmitted = false.obs;
  final cityOrTownSubmitted = false.obs;
  final stepRequirementsMet = false.obs;
  final cityOrTown = "".obs;

  Rx<String> currentCitiesAndTownsInZambiaDropDownValue =
      "Lusaka".obs;

  final propertyNameTextEditingController = TextEditingController();

  List<String> citiesAndTownsInZambia =
      {
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
      }.toList();

  @override
  void onInit() {
    super.onInit();

    /// Watch each observable and update `stepRequirementsMet` accordingly yeah
    everAll([
      propertyNameSubmitted,
      cityOrTownSubmitted,
    ], (_) => updateStepRequirementsMet());
  }

  void updateStepRequirementsMet() {
    stepRequirementsMet.value = propertyNameSubmitted.value;
  }

  void addNameAndCityDetails() {
    final storage = GetStorage();
    final savedListing = Listing.fromJson(storage.read("listing"));
    // update property name
    savedListing.propertyName = propertyNameTextEditingController.text;
    // update city or town
    savedListing.city = currentCitiesAndTownsInZambiaDropDownValue.value;
    // Write the updated listing back to storage
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
    storage.write("listingStage", ListingStage.stepFour.name);
  }

  onEditingComplete() {
    propertyNameSubmitted.value = true;
  }
}
