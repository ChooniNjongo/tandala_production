import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../features/booking/controllers/search_filter_controller.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_strings.dart';
import '../../../../../../../utils/device/device_utility.dart';
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
        SizedBox(height: TSizes.spaceBtwItems),
        AmenitiesFilterWidget(),
      ],
    );
  }
}

class AmenitiesFilterWidget extends StatelessWidget {
  const AmenitiesFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    final controller = Get.put(SearchFilterController());

    // List of amenities for easier management
    final amenities = [
      {
        'type': 'Wifi',
        'value': () => controller.hasWifi.value,
        'onChanged': (value) {
          controller.hasWifi.value = !controller.hasWifi.value;
          controller.searchWithFilters();
        },
      },
      {
        'type': 'Swimming Pool',
        'value': () => controller.hasSwimmingPool.value,
        'onChanged': (value) {
          controller.hasSwimmingPool.value = !controller.hasSwimmingPool.value;
          controller.searchWithFilters();
        },
      },
      {
        'type': 'Air conditioning',
        'value': () => controller.hasAirConditioning.value,
        'onChanged': (value) {
          controller.hasAirConditioning.value = !controller.hasAirConditioning.value;
          controller.searchWithFilters();
        },
      },
      {
        'type': 'TV',
        'value': () => controller.hasTV.value,
        'onChanged': (value) {
          controller.hasTV.value = !controller.hasTV.value;
          controller.searchWithFilters();
        },
      },
      {
        'type': 'Breakfast',
        'value': () => controller.providesBreakfast.value,
        'onChanged': (value) {
          controller.providesBreakfast.value = !controller.providesBreakfast.value;
          controller.searchWithFilters();
        },
      },
      {
        'type': 'Gym',
        'value': () => controller.hasGym.value,
        'onChanged': (value) {
          controller.hasGym.value = !controller.hasGym.value;
          controller.searchWithFilters();
        },
      },
    ];

    return Obx(() {
      if (isMobile) {
        // Mobile layout: 2 columns
        return Column(
          children: [
            for (int i = 0; i < amenities.length; i += 2)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: AmenityTile(
                        isSelected: true,
                        amenityType: amenities[i]['type'] as String,
                        value: (amenities[i]['value'] as Function)(),
                        onChanged: amenities[i]['onChanged'] as Function(bool?),
                      ),
                    ),
                    const SizedBox(width: 12),
                    if (i + 1 < amenities.length)
                      Expanded(
                        child: AmenityTile(
                          isSelected: true,
                          amenityType: amenities[i + 1]['type'] as String,
                          value: (amenities[i + 1]['value'] as Function)(),
                          onChanged: amenities[i + 1]['onChanged'] as Function(bool?),
                        ),
                      )
                    else
                      const Expanded(child: SizedBox()), // Empty space for odd number of items
                  ],
                ),
              ),
          ],
        );
      } else {
        // Desktop layout: Wrap (original behavior)
        return Wrap(
          runSpacing: 12,
          spacing: 12,
          children: amenities.map((amenity) {
            return AmenityTile(
              isSelected: true,
              amenityType: amenity['type'] as String,
              value: (amenity['value'] as Function)(),
              onChanged: amenity['onChanged'] as Function(bool?),
            );
          }).toList(),
        );
      }
    });
  }
}