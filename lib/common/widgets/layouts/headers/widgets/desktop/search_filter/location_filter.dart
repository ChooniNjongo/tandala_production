import 'package:cwt_ecommerce_admin_panel/common/widgets/layouts/headers/widgets/desktop/search_filter/search_location.dart';
import 'package:flutter/material.dart';
import '../../../../../../../utils/constants/text_strings.dart';
import 'filter_section_title.dart';

class LocationFilter extends StatefulWidget {
  const LocationFilter({super.key});

  @override
  State<LocationFilter> createState() => _LocationFilterState();
}

class _LocationFilterState extends State<LocationFilter> {
  String? selectedLocation;

  void _onLocationSelected(String location) {
    setState(() {
      selectedLocation = location;
    });

    // Handle the selected location here
    // You can call your filter logic, API calls, etc.
    print('Selected location: $location');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FilterSectionTitle(title: TTexts.location),
        const SizedBox(height: 8),
        const FilterSectionSubtitle(subTitle: TTexts.locationSubtitle),
        const SizedBox(height: 16),

        // Search location widget
        SearchLocation(
          hintText: 'Search for a destination...',
          onLocationSelected: _onLocationSelected,
          initialValue: selectedLocation,
        ),

        // Optional: Show selected location
        if (selectedLocation != null) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on,
                  size: 16,
                  color: Colors.blue.shade600,
                ),
                const SizedBox(width: 6),
                Text(
                  selectedLocation!,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLocation = null;
                    });
                  },
                  child: Icon(
                    Icons.close,
                    size: 14,
                    color: Colors.blue.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}