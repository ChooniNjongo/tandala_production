import 'package:get/get.dart';

class NotificationsIconController extends GetxController {
  final RxBool isNotificationsTabOpen = false.obs;

  void notificationIconOnTap() {
    isNotificationsTabOpen.value = !isNotificationsTabOpen.value;
  }
}
