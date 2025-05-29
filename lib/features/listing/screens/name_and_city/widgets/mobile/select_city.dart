import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/drop_down_selection/drop_down_selection.dart';
import '../../../../controllers/name_and_city_controller.dart';

class CitySelection extends StatelessWidget {
  const CitySelection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NameAndCityStepController());
    return TDropDownSelection(
      title: 'Please select the city your property is situated in',
      value: controller.currentCitiesAndTownsInZambiaDropDownValue,
      itemTitles: controller.citiesAndTownsInZambia,
      icon: const Icon(Icons.location_city), isSelected: true, // Wrap with Icon()
    );
  }
}


