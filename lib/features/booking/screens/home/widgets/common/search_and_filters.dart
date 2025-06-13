import 'dart:ui'; // Add this import for ImageFilter
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../common/widgets/layouts/headers/widgets/desktop/search_bar/search_bar.dart';
import '../../../../../../common/widgets/layouts/headers/widgets/desktop/search_filter/filters.dart';
import '../../../../../../utils/constants/image_strings.dart';

class TSearchAndFilters extends StatefulWidget {
  const TSearchAndFilters({super.key});

  @override
  State<TSearchAndFilters> createState() => _TSearchAndFiltersState();
}

class _TSearchAndFiltersState extends State<TSearchAndFilters> {
  OverlayEntry? _overlayEntry;

  void _showFilterOverlay() {
    if (_overlayEntry != null) return; // Prevent multiple overlays

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Background barrier with blur effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: GestureDetector(
                onTap: _hideFilterOverlay,
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
                    color: const Color(0xFF1F2A2A),
                    width: 1.5,
                  ),
                  color: const Color(0xFF131B1B),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Close button header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: _hideFilterOverlay,
                          child: SvgPicture.asset(TImages.filterCloseSvg),
                        ),
                        const Text(
                          'Filters',
                          style: TextStyle(
                            fontFamily: 'InterDisplay',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const Icon(
                          Icons.close,
                          color: Colors.transparent,
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40,),
                    // Filter content
                    const Expanded(
                      child: Filters(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideFilterOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _hideFilterOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TSearchBar(),
        Row(
          children: [
            const SizedBox(width: 8),
            Container(
              width: 46,
              height: 46,
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: const Color(0xFF1A2323),
              ),
              child: SvgPicture.asset(TImages.quickFilter),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: _showFilterOverlay,
              child: Container(
                width: 46,
                height: 46,
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: const Color(0xFF1A2323),
                ),
                child: SvgPicture.asset(TImages.filters),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
