import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../features/booking/controllers/search_filter_controller.dart';
import '../../../../../../utils/constants/colors.dart';

class PriceSlider extends StatefulWidget {
  const PriceSlider({super.key});

  @override
  State<PriceSlider> createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  RangeValues _currentRangeValues = const RangeValues(100, 8000);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFilterController());
    return SizedBox(
      width: 220,
      child: RangeSlider(
        inactiveColor: TColors.white,
        activeColor: TColors.primary500,
        values: _currentRangeValues,
        min: 0,
        max: 8000,
       // divisions: 3,
        labels: RangeLabels(
          _currentRangeValues.start.round().toString(),
          _currentRangeValues.end.round().toString(),
        ),
        onChanged: (RangeValues values) {
          controller.currentRange.value =  values;
          setState(() {
            _currentRangeValues = values;
          });
        },
      ),
    );
  }
}