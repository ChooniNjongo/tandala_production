import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../features/booking/controllers/search_filter_controller.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_strings.dart';
import 'amenity_tile.dart';
import 'filter_section_title.dart';

class AmenitiesFilter extends StatelessWidget {
  const AmenitiesFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterSectionTitle(title: TTexts.amenities),
        SizedBox(height: TSizes.spaceBtwSections),
        AmenitiesFilterWidget(),
        SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}

class AmenitiesFilterWidget extends StatelessWidget {
  const AmenitiesFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFilterController());
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: Column(
              children: [
                AmenityTile(
                  amenityType: 'Wifi',
                  value: controller.hasWifi.value,
                  onChanged: (value) {
                    controller.hasWifi.value = !controller.hasWifi.value;
                    controller.searchWithFilters();
                  },
                ),
                AmenityTile(
                  amenityType: 'Swimming Pool',
                  value: controller.hasSwimmingPool.value,
                  onChanged: (value) {
                    controller.hasSwimmingPool.value =
                        !controller.hasSwimmingPool.value;
                    controller.searchWithFilters();
                  },
                ),
                AmenityTile(
                  amenityType: 'Air conditioning',
                  value: controller.hasAirConditioning.value,
                  onChanged: (value) {
                    controller.hasAirConditioning.value =
                        !controller.hasAirConditioning.value;
                    controller.searchWithFilters();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                AmenityTile(
                  amenityType: 'TV',
                  value: controller.hasTV.value,
                  onChanged: (value) {
                    controller.hasTV.value = !controller.hasTV.value;
                    controller.searchWithFilters();
                  },
                ),
                AmenityTile(
                  amenityType: 'Breakfast',
                  value: controller.providesBreakfast.value,
                  onChanged: (value) {
                    controller.providesBreakfast.value =
                        !controller.providesBreakfast.value;
                    controller.searchWithFilters();
                  },
                ),
                AmenityTile(
                  amenityType: 'Gym',
                  value: controller.hasGym.value,
                  onChanged: (value) {
                    controller.hasGym.value = !controller.hasGym.value;
                    controller.searchWithFilters();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
