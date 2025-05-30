import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../data/repositories/listing/listing_repository.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../booking/models/property/listing.dart';
import '../../booking/models/property/room.dart';
import '../../personalization/controllers/user_controller.dart';

class ListingSubmissionController extends GetxController {
  static ListingSubmissionController get instance => Get.find();

  /// Variables
  final isLoadingGPS = false.obs;
  final isSubmittingProperty = false.obs;
  final imageUploading = false.obs;
  final propertyRepository = Get.put(PropertyRepository());
  final userRepository = Get.put(UserRepository());
  final userController = Get.put(UserController());
  Rx<Listing> propertyListing = Listing.getEmptyListing().obs;

  //  add code to get empty list of rooms..Rx<Room> listingOfRooms = Listing.getEmptyListing().obs;
  Rx<Room> stateRoom = Room.getEmptyRoom().obs;
  Rx<double> propertyLatitude = 0.0.obs;
  Rx<double> propertyLongitude = 0.0.obs;

  // This Rx variable will be used to trigger a UI refresh
  RxBool shouldRefresh = false.obs;

  // Property Details
  GlobalKey<FormState> propertyDetailsFormKey =
      GlobalKey<FormState>(); // Form key for form validation
  GlobalKey<FormState> roomDetailsFormKey =
      GlobalKey<FormState>(); // Form key for form validation
  // GlobalKey<FormState> roomDetailsFormKey = GlobalKey<FormState>();
  final TextEditingController propertyNameController = TextEditingController();
  final TextEditingController roomNameController = TextEditingController();
  final TextEditingController hostNameController = TextEditingController();
  final TextEditingController propertyOwnerController = TextEditingController();
  final TextEditingController propertyAreaController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController roomDescriptionController =
      TextEditingController();
  final TextEditingController guestCountController = TextEditingController();
  final TextEditingController bedCountController = TextEditingController();
  final TextEditingController bathroomCountController = TextEditingController();
  final TextEditingController taxIdentifierController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  Rx<String> initialCategoryDropDownValue = "Lodge".obs;
  Rx<String> initialBusinessTypeDropDownValue = "Individual".obs;
  Rx<String> initialCitiesAndTownsInZambiaDropDownValue = "Lusaka".obs;
  Rx<String> initialTvOptionDropDownValue = "No".obs;
  Rx<String> initialBreakFastDropDownValue = "No".obs;
  Rx<String> initialKitchenDropDownValue = "No".obs;
  Rx<String> initialCarParkDropDownValue = "No".obs;
  Rx<String> initialGymDropDownValue = "No".obs;
  Rx<String> initialSmokingDropDownValue = "No".obs;
  Rx<String> initialWifiDropDownValue = "No".obs;
  Rx<String> initialFreeCancellationDropDownValue = "No".obs;
  Rx<String> initialAirConditioningOptionDropDownValue = "No".obs;
  Rx<String> initialHasSwimmingPoolDropDownValue = "No".obs;
  Rx<String> initialPetsAllowedDropDownValue = "No".obs;
  List<String> businessTypeCategory = ["Individual", "Registered"];
  List<String> hasPoolCategory = ["Yes", "No"];
  List<String> tVOption = ["Yes", "No"];
  List<String> kitchen = ["Yes", "No"];
  List<String> carPark = ["Yes", "No"];
  List<String> wifi = ["Yes", "No"];
  List<String> breakFast = ["Yes", "No"];
  List<String> gym = ["Yes", "No"];
  List<String> smoking = ["Yes", "No"];
  List<String> freeCancellation = ["Yes", "No"];
  List<String> airConditioningOption = ["Yes", "No"];
  List<String> allowsPetsCategory = ["Yes", "No"];
  List<String> propertyTypeCategory = [
    "Lodge",
    "House",
    "Hotel",
    "Motel",
    "Safari Lodge",
    "Safari Hotel",
    "Camping Site",
  ];
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
    final storage = GetStorage();

    // Store the enum as a string (e.g. "unInitiated") if not already stored
    //storage.writeIfNull("listingStage", ListingStage.stepOne.name);

    final savedListingStage = storage.read("listingStage");
    print("successfully saved listing stage ");
    print(savedListingStage);

    super.onInit();
  }

  /// Functions
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      TLoaders.warningSnackBar(title: '"Please enable your Location"');
      return Future.error("Location services are disabled.");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        TLoaders.warningSnackBar(title: "Location permissions are denied");
        return Future.error("Location permissions are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      TLoaders.warningSnackBar(
        title:
            "Location permissions are permanently denied,we cannot request your Location",
      );
      return Future.error(
        "Location permissions are permanently denied,we cannot request your Location",
      );
    }
    return await Geolocator.getCurrentPosition();
  }

  void getCoordinates() async {
    isLoadingGPS.value = true;
    await _getCurrentLocation().then((value) {
      propertyLatitude.value = value.latitude;
      propertyLongitude.value = value.longitude;
    });

    if (propertyLatitude.value == 0.0) {
      TLoaders.warningSnackBar(title: "There was an error getting location");
    }

    if (propertyLatitude.value != 0.0) {
      TLoaders.successSnackBar(
        title: "Successful",
        message: "Location was successfully captured!",
      );
      //   Get.offAll(const UploadPropertyImagesScreen());
    }
    isLoadingGPS.value = false;
  }

  /// Upload Property Picture
  uploadPropertyPicture(String imagesArea) async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );
      if (image != null) {
        imageUploading.value = true;
        const imageUrl = "kj";
        // Add ImageUrl to property images
        if (imagesArea == 'propertyImages') {
          propertyListing.update((val) {
            val!.propertyImages.add(imageUrl);
          });
        }

        if (imagesArea == 'bedAndBashBoardPictures') {
          stateRoom.update((val) {
            val!.bedAndBashBoardPictures.add(imageUrl);
          });
        }

        if (imagesArea == 'bathAndToilet') {
          stateRoom.update((val) {
            val!.bathAndToilet.add(imageUrl);
          });
        }

        if (imagesArea == 'otherRoomPictures') {
          stateRoom.update((val) {
            val!.otherRoomPictures.add(imageUrl);
          });
        }

        TLoaders.customToast(message: 'Image has been uploaded');
        // Trigger UI refresh
        shouldRefresh.value = !shouldRefresh.value;
      }
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Oh Snap',
        message: 'Something went wrong:  $e',
      );
    } finally {
      imageUploading.value = false;
    }
  }

  /// Remove Picture from image lists
  /// Delete Property Picture
  void deletePropertyPicture(String imageUrl) {
    propertyListing.update((val) {
      val!.propertyImages.remove(imageUrl);
    });
    // Trigger UI refresh
    shouldRefresh.value = !shouldRefresh.value;
  }

  /// Remove Picture from image lists
  /// Delete deleteBedAndDashPicture Picture
  void deleteBedAndDashPicture(String imageUrl) {
    stateRoom.update((val) {
      val!.bedAndBashBoardPictures.remove(imageUrl);
    });
    // Trigger UI refresh
    shouldRefresh.value = !shouldRefresh.value;
  }

  /// Remove Picture from image lists
  /// Delete deleteBedAndDashPicture Picture
  void deleteBathAndToiletPicture(String imageUrl) {
    stateRoom.update((val) {
      val!.bathAndToilet.remove(imageUrl);
    });
    // Trigger UI refresh
    shouldRefresh.value = !shouldRefresh.value;
  }

  /// Remove Picture from image lists
  /// Delete deleteBedAndDashPicture Picture
  void deleteRoomPicture(String imageUrl) {
    stateRoom.update((val) {
      val!.otherRoomPictures.remove(imageUrl);
    });
    // Trigger UI refresh
    shouldRefresh.value = !shouldRefresh.value;
  }

  ///  validateAndRedirect
  Future<void> validateAndRedirect() async {
    updatePropertyListing();
    try {
      // Form Validation
      if (!propertyDetailsFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'Your property is being submitted for review',
        TImages.docerAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //  Get.to(() => const AddRoomScreen());
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Update PropertyListing Object
  void updatePropertyListing() {
    propertyListing.update((val) {
      val!.propertyName = propertyNameController.text;

      val.description = descriptionController.text;
      val.area = propertyAreaController.text;
      val.city = initialCitiesAndTownsInZambiaDropDownValue.value;
      val.hasSwimmingPool = initialHasSwimmingPoolDropDownValue.value == "Yes";
      val.latitude = propertyLatitude.value;
      val.longitude = propertyLongitude.value;
      val.hasWifi = initialWifiDropDownValue.value == "Yes";
      val.hasBedNBreakfast = initialBreakFastDropDownValue.value == "Yes";
      val.hasGym = initialGymDropDownValue.value == "Yes";
      val.hasCarPark = initialCarParkDropDownValue.value == "Yes";
      val.hasKitchen = initialKitchenDropDownValue.value == "Yes";
      val.hostName = userController.user.value.firstName;
      // val.userId = AuthenticationRepository.instance.authUser!.uid;
    });
  }

  /// Update PropertyListing Object
  void updateStateRoom() {
    stateRoom.update((val) {
      val!.roomDescription = roomDescriptionController.text;
      val.price = double.parse(priceController.text);
      val.bedCount = int.parse(bedCountController.text);
      val.guestCount = int.parse(guestCountController.text);
      val.hasTv = initialTvOptionDropDownValue.value == "Yes";
      val.hasAirConditioning = initialWifiDropDownValue.value == "Yes";
      val.smokingAllowed = initialSmokingDropDownValue.value == "Yes";
      val.petAllowed = initialPetsAllowedDropDownValue.value == "Yes";
    });
  }

  /// Submit Property
  void submitProperty() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'Your property is being submitted for review',
        TImages.docerAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        // Show some Generic Error to the user
        TLoaders.errorSnackBar(
          title: 'Oh Snap',
          message: "No Network. Please check connection and try again",
        );
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!propertyDetailsFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      await PropertyRepository.instance.submitProperty(propertyListing.value);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your property has been submitted for review',
      );

      // Move to the Review Screen
      /*      Get.off(
        () => SuccessScreen(
          image: TImages.successfullyRegisterAnimation,
          title: TTexts.yourPropertySubmittedTitle,
          subTitle: TTexts.yourPropertySubmittedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );*/
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      print(propertyListing.value.propertyName);
    }
  }

  /// Delete Listing Warning
  void Function()? deleteListingWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Listing',
      middleText:
          'Are you sure you want to delete your listing permanently? This action is not reversible and all of your data will be removed permanently',
      confirm: ElevatedButton(
        onPressed: deleteListing,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
    return null;
  }

  void deleteListing() {
    propertyListing.value = Listing.getEmptyListing();
    AuthenticationRepository.instance.screenRedirect();
  }

  void addRoom() {
    if (!roomDetailsFormKey.currentState!.validate()) {
      // Remove Loader
      return;
    }
    updateStateRoom();
    propertyListing.update((val) {
      val!.rooms.add(stateRoom.value);
    });

    /*  Get.off(
      () => const AddRoomSuccessScreen(),
    );*/
  }

  void addAnotherRoom() {
    // wipe the stateRoom data
    stateRoom.value = Room.getEmptyRoom();

    roomNameController.text = "";
    guestCountController.text = "";
    bathroomCountController.text = "";
    bedCountController.text = "";
    priceController.text = "";
    roomDescriptionController.text = "";

    // Migrate to AddRoom Screen
    //Get.off(() => const AddRoomScreen());
  }


}
