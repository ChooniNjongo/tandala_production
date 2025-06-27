import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../features/booking/controllers/base_counter_controller.dart';

class CounterWidget<T extends BaseCounterController> extends StatelessWidget {
  final T controller;
  final double size;
  final Color? backgroundColor;
  final Color? buttonColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final VoidCallback? onChanged;
  final Widget? customDisplay;
  final bool showLeadingZero;

  const CounterWidget({
    super.key,
    required this.controller,
    this.size = 32.0,
    this.backgroundColor,
    this.buttonColor,
    this.textColor,
    this.textStyle,
    this.onChanged,
    this.customDisplay,
    this.showLeadingZero = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Minus Button
        Obx(() => GestureDetector(
          onTap: () {
            controller.decrement();
            if (onChanged != null) onChanged!();
          },
          child: Container(
            width: size,
            height: size,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: controller.count > 0
                  ? (buttonColor ?? const Color(0xFF00BCD4)) // Same as plus when count > 0
                  : (buttonColor ?? const Color(0xFF2E3A3A)), // Different color when count is 0
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset("assets/icons/designer_assets/Minus.svg"),
          ),
        )),

        // Counter Display with Fixed Width
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: size * 1.2, // Fixed width to prevent button movement
          child: customDisplay ??
              Obx(() {
                String displayText;

                if (controller.count == 0) {
                  displayText = "Any";
                } else if (showLeadingZero && controller.count < 10) {
                  displayText = controller.count.toString().padLeft(2, '0');
                } else {
                  displayText = controller.count.toString();
                }

                return Text(
                  displayText,
                  textAlign: TextAlign.center, // Center the text
                  style: textStyle ??
                      TextStyle(
                        fontFamily: 'Inter Display',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 16 / 14, // line-height as ratio
                        letterSpacing: 0,
                        color: textColor ?? Colors.grey.shade400,
                      ),
                );
              }),
        ),

        // Plus Button
        GestureDetector(
          onTap: () {
            controller.increment();
            if (onChanged != null) onChanged!();
          },
          child: Container(
              width: size,
              height: size,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: buttonColor ?? const Color(0xFF00BCD4),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset("assets/icons/designer_assets/Plus.svg")
          ),
        ),
      ],
    );
  }
}