import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/navigation/nav_bar.dart';
import '../../../controllers/nav_bar_controller.dart';
import '../widgets/mobile/home_content.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final NavBarController navBarController = Get.put(NavBarController());

    return Scaffold(
      body: HomeContent(navBarController: navBarController),
      bottomNavigationBar: Obx(() => AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: navBarController.isNavBarVisible.value ? 80 : 0, // Adjust height as needed
        child: navBarController.isNavBarVisible.value
            ? const NavBar() // Replace with your actual NavBar widget
            : const SizedBox.shrink(),
      )),
    );
  }
}