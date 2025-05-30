import 'package:cwt_ecommerce_admin_panel/common/widgets/question_container/question_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/color_system.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/listing_process_controller.dart';

class LoadUserDraftListingMobile extends StatelessWidget {
  const LoadUserDraftListingMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ListingProcessController());

    // Schedule the function call after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        controller.getUserListings();
      });
    });

    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            QuestionContainer(
              question: "Loading draft listing",
              body: "Please wait as we fetch your data",
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Center(
              child: SpinKitPouringHourGlass(
                color: TColorSystem.primary500,
                size: 50.0,
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}