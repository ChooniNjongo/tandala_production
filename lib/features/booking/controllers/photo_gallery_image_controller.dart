import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';


/// /
class PhotoGalleryController extends GetxController {
  static PhotoGalleryController get instance => Get.find();


  final carousalController = CarouselSliderController();
  Rx<int> activeIndex = 0.obs;
  List<String> imageUrls = [];



  void next() {
    carousalController.nextPage(duration: const Duration(milliseconds: 500));
  }
  void previous() {
    carousalController.previousPage(duration: const Duration(milliseconds: 500));
  }

  animateToSlide(int index) => carousalController.animateToPage(index);
  onPageChanged(int index) {
    activeIndex.value = index;
  }
}