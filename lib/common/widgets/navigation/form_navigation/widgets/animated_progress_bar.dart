import 'package:flutter/material.dart';

import '../../../../../utils/constants/color_system.dart';

class AnimatedProgressBar extends StatefulWidget {
  const AnimatedProgressBar({
    super.key,
    required this.duration,
    required this.initialValue,
    required this.targetValue,
  });

  final Duration duration;
  final double initialValue;
  final double targetValue;

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(
      begin: widget.initialValue,
      end: widget.targetValue,
    ).animate(_controller);

    _controller.forward(); // Start the animation
  }

  @override
  void didUpdateWidget(covariant AnimatedProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.targetValue != oldWidget.targetValue) {
      // Update the animation without resetting or restarting
      _animation = Tween<double>(
        begin: _animation.value, // Start from current value
        end: widget.targetValue, // Animate to new target value
      ).animate(_controller);
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return LinearProgressIndicator(
          value: _animation.value,
          backgroundColor: TColorSystem.n500,
          valueColor: const AlwaysStoppedAnimation<Color>(
            TColorSystem.primary500,
          ),
        );
      },
    );
  }
}