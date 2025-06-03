import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../../common/widgets/navigation/nav_bar.dart';
import '../../../controllers/nav_bar_controller.dart';
import '../widgets/mobile/animated_drawer.dart';
import '../widgets/mobile/home_content.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final NavBarController navBarController = Get.put(NavBarController());

    return Scaffold(
      body: HomeContent(navBarController: navBarController),
      bottomNavigationBar: Obx(() => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: navBarController.isNavBarVisible.value ? 80 : 0, // Adjust height as needed
        child: navBarController.isNavBarVisible.value
            ? const NavBar() // Replace with your actual NavBar widget
            : const SizedBox.shrink(),
      )),
    );
  }
}