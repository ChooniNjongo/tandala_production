import 'package:flutter/material.dart';

import '../../../../../../features/booking/screens/home/widgets/common/filter_overlay_header.dart';
import '../../../../../../utils/constants/colors.dart';
import '../desktop/search_filter/filter_action_button.dart';
import '../desktop/search_filter/filters.dart';

import 'package:flutter/material.dart';

import '../../../../../../features/booking/screens/home/widgets/common/filter_overlay_header.dart';
import '../../../../../../utils/constants/colors.dart';
import '../desktop/search_filter/filter_action_button.dart';
import '../desktop/search_filter/filters.dart';

class MobileFilters extends StatelessWidget {
  const MobileFilters({super.key});

  void _close(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
        border: Border.all(
          color: const Color(0xFF2F3D3D).withOpacity(0.50),
          width: 2,
        ),
        color: const Color(0xFF131B1B),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF979FB7).withOpacity(0.10),
            offset: const Offset(0, 4),
            blurRadius: 120,
            spreadRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      height: MediaQuery.of(context).size.height,

      child: Column(
        children: [
          FilterOverlayHeader(onClose: () => _close(context)),
          const SizedBox(height: 24,),
          const Expanded(child: Filters()),
          const FilterActionButtons(),
        ],
      ),
    );
  }
}
