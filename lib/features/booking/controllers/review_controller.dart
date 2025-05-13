import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/helper_functions.dart';

class ReviewController extends GetxController {
  static ReviewController get instance => Get.find();

  final isRatingOneSelected = false.obs;
  final isRatingTwoSelected = false.obs;
  final isRatingThreeSelected = false.obs;
  final isRatingFourSelected = false.obs;
  final isRatingFiveSelected = false.obs;
  final review = "".obs;
  TextEditingController description = TextEditingController();
  final titleDescriptionFormKey = GlobalKey<FormState>();


  final rating = 0.0.obs;

  void setRating() {
    if (isRatingOneSelected.value) {
      rating.value = 1.0;
    } else if (isRatingTwoSelected.value) {
      rating.value = 2.0;
    } else if (isRatingThreeSelected.value) {
      rating.value = 3.0;
    } else if (isRatingFourSelected.value) {
      rating.value = 4.0;
    } else if (isRatingFiveSelected.value) {
      rating.value = 5.0;
    } else {
      rating.value = 0.0; // Default if no rating is selected
    }
  }

  void resetRatings(){
     isRatingOneSelected.value = false;
     isRatingTwoSelected.value = false;
     isRatingThreeSelected.value = false;
     isRatingFourSelected.value = false;
     isRatingFiveSelected.value = false;
  }


  void Function()? onRatingOneTapped(){
    resetRatings();
    THelperFunctions.toggleObxValue(isRatingOneSelected);
    setRating();
    return null;
  }

  void Function()? onRatingTwoTapped(){
    resetRatings();
    THelperFunctions.toggleObxValue(isRatingTwoSelected);
    setRating();
    return null;
  }

  void Function()? onRatingThreeTapped(){
    resetRatings();
    THelperFunctions.toggleObxValue(isRatingThreeSelected);
    setRating();
    return null;
  }

  void Function()? onRatingFourTapped(){
    resetRatings();
    THelperFunctions.toggleObxValue(isRatingFourSelected);
    setRating();
    return null;
  }

  void Function()? onRatingFiveTapped(){
    resetRatings();
    THelperFunctions.toggleObxValue(isRatingFiveSelected);
    setRating();
    return null;
  }

}
