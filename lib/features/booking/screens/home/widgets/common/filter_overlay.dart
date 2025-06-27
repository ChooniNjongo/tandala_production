// File: lib/features/search/widgets/filter_overlay.dart

import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../../../common/widgets/layouts/headers/widgets/desktop/search_filter/filter_action_button.dart';
import '../../../../../../common/widgets/layouts/headers/widgets/desktop/search_filter/filters.dart';
import '../../../../../../utils/constants/colors.dart';
import 'filter_overlay_header.dart';

class FilterOverlay extends StatelessWidget {
  final VoidCallback onClose;

  const FilterOverlay({
    super.key,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background barrier with blur effect
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: GestureDetector(
              onTap: onClose,
              child: Container(
                color: const Color(0xFF001113).withOpacity(0.4),
              ),
            ),
          ),
        ),
        // Filter popup
        Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              padding: const EdgeInsets.all(40),
              constraints: const BoxConstraints(
                maxWidth: 500,
                maxHeight: 600,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: TColors.filterPopupBorder,
                  width: 1.5,
                ),
                color: TColors.filterPopupBackground,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FilterOverlayHeader(onClose: onClose),
                  const SizedBox(height: 40),
                  const Expanded(child: Filters()),
                  const FilterActionButtons(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}