import 'package:get/get.dart';

class MobileSearchIconController extends GetxController {
  static MobileSearchIconController get instance => Get.find();

  /// Variables

  final showSearchAndFilter = false.obs;

  /// Functions
  void onSearchIconTapped() {
    showSearchAndFilter.value = !showSearchAndFilter.value;

  }
}
