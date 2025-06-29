import 'package:cwt_ecommerce_admin_panel/features/listing_submission/screens/amenities/widgets/mobile/parking_and_facilities.dart';
import 'package:cwt_ecommerce_admin_panel/features/listing_submission/screens/amenities/widgets/mobile/services.dart';
import 'package:cwt_ecommerce_admin_panel/features/listing_submission/screens/amenities/widgets/mobile/views_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/buttons/extensible_hug_content_button.dart';
import '../../../../../../common/widgets/navigation/form_navigation/form_navigation.dart';
import '../../../../../../common/widgets/question_container/question_container.dart';
import '../../../../../../routes/routes.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../controllers/amenities_step_controller.dart';
import 'bathroom_section.dart';
import 'bedroom_and_laundry.dart';
import 'entertainment.dart';
import 'heating_and_cooling.dart';
import 'home_safety.dart';
import 'kitchen_and_dining.dart';
import 'location_features.dart';
import 'outdoor.dart';

class AmenitiesBody extends StatelessWidget {
  const AmenitiesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AmenitiesStepController());
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpaceDesktop),
      child: Column(
        children: [
          const FormNavigation(
            showLeftIcon: true,
            svgImageString: TImages.home,
            step3Text: 'Step 4: Amenities ,Services and Rules',
            initialValue: 0.09,
            targetValue: 0.1,
          ),
           const SizedBox(height: TSizes.spaceBtwSections * 2),
          const QuestionContainer(
            question: 'Let’s dig deeper!',
            body:
                'We have some recommended options for the interests that you have chosen.',
          ),

          const SizedBox(height: TSizes.spaceBtwSections),
          const ViewsSection(),
          const BathroomSection(),
          const BedroomAndLaundrySection(),
          const EntertainmentSection(),
          const HeatingAndCoolingSection(),
          const HomeSafetySection(),
          const KitchenAndDiningSection(),
          const LocationFeaturesSection(),
          const OutdoorSection(),
          const ParkingAndFacilitiesSection(),
          const ServicesSection(),
          const SizedBox(height: TSizes.spaceBtwSections),
          TExtensibleHugContentButton(
            rightIcon: TImages.arrowRight,
            buttonLabel: 'Continue',
            onPressed: () {
              controller.addAmenities();
              Get.toNamed(TRoutes.displayCover);
            },
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
