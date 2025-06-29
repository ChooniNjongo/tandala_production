import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
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
              child:TypeAheadField(
                builder: (context, ctr, focusNode) {
                  return TextFormField(
                    focusNode: focusNode,
                    controller: controller.cityTextField = ctr,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Select Brand',
                      suffixIcon: Icon(Iconsax.box),
                    ),
                  );
                },
                suggestionsCallback: (pattern) {
                  // Return filtered brand suggestions based on the search pattern
                  return controller.citiesAndTownsInZambia.where((city) => city.contains(pattern)).toList();
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSelected: (suggestion) {
                  controller.selectedCity.value = suggestion;
                  controller.cityTextField.text = suggestion;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
