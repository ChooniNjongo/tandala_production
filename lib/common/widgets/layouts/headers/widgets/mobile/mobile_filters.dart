import 'package:flutter/material.dart';

import '../../../../../../features/booking/screens/home/widgets/common/filter_overlay_header.dart';
import '../../../../../../utils/constants/colors.dart';
import '../desktop/search_filter/filter_action_button.dart';
import '../desktop/search_filter/filters.dart';

class AnimatedMobileFilters extends StatefulWidget {
  const AnimatedMobileFilters({super.key});

  @override
  State<AnimatedMobileFilters> createState() => _AnimatedMobileFiltersState();
}

class _AnimatedMobileFiltersState extends State<AnimatedMobileFilters>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400), // Slow animation duration
      vsync: this,
    );

    // Slide animation from bottom to top
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from bottom (completely hidden)
      end: Offset.zero, // End at original position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic, // Smooth easing curve
    ));

    // Fade animation for smooth appearance
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Start animation when widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _closeWithAnimation() async {
    await _animationController.reverse();
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          padding: const EdgeInsets.all(24),
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: TColors.primaryBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
          ),
          child:  Column(
            children: [
              FilterOverlayHeader(onClose: _closeWithAnimation),
              const Expanded(child: Filters()),
              const FilterActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
