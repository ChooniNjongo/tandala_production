// File: lib/features/search/services/filter_overlay_service.dart

import 'package:flutter/material.dart';

import 'filter_overlay.dart';

class FilterOverlayService {
  OverlayEntry? _overlayEntry;

  void showFilterOverlay(BuildContext context) {
    if (_overlayEntry != null) return; // Prevent multiple overlays

    _overlayEntry = OverlayEntry(
      builder: (context) => FilterOverlay(
        onClose: hideFilterOverlay,
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void hideFilterOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void dispose() {
    hideFilterOverlay();
  }

  bool get isOverlayVisible => _overlayEntry != null;
}