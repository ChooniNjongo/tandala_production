import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../controllers/name_and_city_controller.dart';

class CitySelection extends StatelessWidget {
  const CitySelection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NameAndCityStepController());

    return TRoundedContainer(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TypeAheadField for city selection
            SizedBox(
              width: 320,
              child: TypeAheadField<String>(
                builder: (context, ctr, focusNode) {
                  return TextFormField(
                    focusNode: focusNode,
                    controller: controller.cityTextField = ctr,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:
                          'Please select the city your property is situated in',
                      suffixIcon: Icon(Icons.location_city),
                    ),
                    onEditingComplete: () => controller.onCityEditingComplete(),
                  );
                },
                suggestionsCallback: (pattern) {
                  // Return filtered city suggestions based on the search pattern
                  if (pattern.isEmpty) {
                    return controller.citiesAndTownsInZambia;
                  }
                  return controller.citiesAndTownsInZambia
                      .where((city) =>
                          city.toLowerCase().contains(pattern.toLowerCase()))
                      .toList();
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    leading: const Icon(Icons.location_city),
                    title: Text(suggestion),
                  );
                },
                onSelected: (suggestion) {
                  controller.selectedCity.value = suggestion;
                  controller.cityTextField.text = suggestion;
                  controller.currentCitiesAndTownsInZambiaDropDownValue.value =
                      suggestion;
                  controller.onCitySelected();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
