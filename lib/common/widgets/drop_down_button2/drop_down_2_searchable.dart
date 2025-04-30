import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/booking/controllers/search_filter_controller.dart';
import '../../../utils/constants/color_system.dart';
import '../containers/rounded_container.dart';

class DropDown2SearchableLocation extends StatefulWidget {
  const DropDown2SearchableLocation({super.key});

  @override
  State<DropDown2SearchableLocation> createState() =>
      _DropDown2SearchableLocationState();
}

class _DropDown2SearchableLocationState
    extends State<DropDown2SearchableLocation> {
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFilterController());
    final List<String> items = controller.citiesAndTownsInZambia;
    return Row(
      children: [
        TRoundedContainer(
          padding: EdgeInsets.zero,
          radius: 4,
          borderColor: TColorSystem.n600,
          showBorder: true,
          showShadow: false,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: const Text(
                'Select Location',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: TColorSystem.n600,
                ),
              ),
              items: items
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal),
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                // search the
                setState(() {
                  selectedValue = value;
                  controller.selectedLocation.value = value!;
                  if (value.isNotEmpty) {
                    controller.searchWithFilters();
                  }
                });
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                width: 240,
              ),
              dropdownStyleData: const DropdownStyleData(
                maxHeight: 400,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
              dropdownSearchData: DropdownSearchData(
                searchController: textEditingController,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Container(
                  height: 50,
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 4,
                    right: 8,
                    left: 8,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: textEditingController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      hintText: 'Search for a city...',
                      hintStyle: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  return item.value
                      .toString()
                      .toLowerCase()
                      .contains(searchValue.toLowerCase());
                },
              ),
              //This to clear the search value when you close the menu
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  textEditingController.clear();
                }
              },
            ),
          ),
        ),
        const SizedBox(
          width: 70,
        )
      ],
    );
  }
}
