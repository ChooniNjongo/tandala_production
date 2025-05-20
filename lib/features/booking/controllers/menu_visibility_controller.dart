import 'package:get/get.dart';


/// /
class MenuVisibilityController extends GetxController {
  static MenuVisibilityController get instance => Get.find();
  
  final RxBool menuIconVisible = true.obs; // Ensure it's defined properly

  // Functions

  void toggle(){ 
    menuIconVisible.value = !menuIconVisible.value;
  }


}