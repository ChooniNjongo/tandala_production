import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../features/booking/controllers/search_filter_controller.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_strings.dart';
import 'amenity_tile.dart';
import 'filter_section_title.dart';

class PropertyRulesFilter extends StatelessWidget {
  const PropertyRulesFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterSectionTitle(title: TTexts.placeRules),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        PropertyRulesWidget(),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}

class PropertyRulesWidget extends StatelessWidget {
  const PropertyRulesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFilterController());
    return Obx(
      () => Column(
        children: [
          Wrap(
            runSpacing: 12,
            children: [
              AmenityTile(
                  isSelected:true,
                  amenityType: 'Allows Pets',
                  value: controller.allowsPets.value,
                  onChanged: (value) {
                    controller.allowsPets.value = !controller.allowsPets.value;
                    controller.searchWithFilters();
                  }),
              AmenityTile(
                  isSelected:true,
                  amenityType: 'Smoking',
                  value: controller.smokingAllowed.value,
                  onChanged: (value) {
                    controller.smokingAllowed.value =
                        !controller.smokingAllowed.value;
                    controller.searchWithFilters();
                  }),
              AmenityTile(
                  isSelected:false,
                  amenityType: 'Partying',
                  value: controller.hasParty.value,
                  onChanged: (value) {
                    controller.hasParty.value = !controller.hasParty.value;
                    controller.searchWithFilters();
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
