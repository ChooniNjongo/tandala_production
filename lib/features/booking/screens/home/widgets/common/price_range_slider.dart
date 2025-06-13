import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../controllers/search_filter_controller.dart';

class PriceSlider extends StatefulWidget {
  const PriceSlider({super.key});

  @override
  State<PriceSlider> createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  RangeValues _currentRangeValues = const RangeValues(100, 8000);

  @override
  Widget build(BuildContext context) {
    final searchController = Get.put(SearchFilterController());
    return SizedBox(
      width: double.infinity,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          // Track height (slider line thickness)
          trackHeight: 2.0, // Adjust this value for track thickness

          // Active track color
          activeTrackColor: TColors.primary500,

          // Inactive track color
          inactiveTrackColor: const Color(0xFFE3E8EF),

          // Thumb (dot) size and appearance
          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 3.0, // Adjust this for dot size
            pressedElevation: 4.0,
            elevation: 4.0,
          ),

          // Thumb color
          thumbColor: TColors.primary500,

          // Overlay (the circle that appears when pressed)
          overlayShape: const RoundSliderOverlayShape(
            overlayRadius: 20.0, // Adjust for press effect size
          ),
          overlayColor: TColors.primary500.withOpacity(0.2),

          // Value indicator (the popup showing values)
          valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
          valueIndicatorColor: TColors.primary500,
          valueIndicatorTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),

          // Range thumb shape for RangeSlider
          rangeThumbShape: const RoundRangeSliderThumbShape(
            enabledThumbRadius: 6.0, // Same as thumbShape for consistency
            pressedElevation: 4.0,
            elevation: 2.0,
          ),

          // Range value indicator
          rangeValueIndicatorShape: const PaddleRangeSliderValueIndicatorShape(),

          // Tick marks (if you enable divisions)
          tickMarkShape: const RoundSliderTickMarkShape(
            tickMarkRadius: 3.0,
          ),
          activeTickMarkColor: TColors.primary500,
          inactiveTickMarkColor: const Color(0xFFE3E8EF),
        ),
        child: RangeSlider(
          inactiveColor: const Color(0xFFE3E8EF),
          activeColor: TColors.primary500,
          values: _currentRangeValues,
          min: 0,
          max: 8000,
          // divisions: 80, // Uncomment if you want tick marks
          labels: RangeLabels(
            '\$${_currentRangeValues.start.round()}',
            '\$${_currentRangeValues.end.round()}',
          ),
          onChanged: (RangeValues values) {
            searchController.currentRange.value = values;
            setState(() {
              searchController.searchWithFilters();
              _currentRangeValues = values;
            });
          },
        ),
      ),
    );
  }
}