import 'package:flutter/material.dart';

import '../../../utils/constants/color_system.dart';
import '../../../utils/constants/typography.dart';

class InputField extends StatelessWidget {

  final String placeHolder;
  final String? helperText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onSuffixIconPressed;
  final void Function()? onPrefixIconPressed;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator; // Add validator property
  final TextEditingController? controller;

  const InputField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    required this.placeHolder,
    this.onSuffixIconPressed,
    this.onPrefixIconPressed,
    this.validator,
    this.helperText,  this.controller, this.onEditingComplete, // Add validator parameter
  });



  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onEditingComplete:onEditingComplete,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              floatingLabelAlignment: FloatingLabelAlignment.start,
              helperText: helperText,
              labelText: placeHolder,
              suffixIcon:
                  onSuffixIconPressed !=
                          null // Wrap suffixIcon with GestureDetector if onSuffixIconPressed is not null
                      ? GestureDetector(
                        onTap: onSuffixIconPressed,
                        child: suffixIcon,
                      )
                      : suffixIcon,
              prefixIcon:
                  onPrefixIconPressed !=
                          null // Wrap prefixIcon with GestureDetector if onPrefixIconPressed is not null
                      ? GestureDetector(
                        onTap: onPrefixIconPressed,
                        child: prefixIcon,
                      )
                      : prefixIcon,
              helperStyle: TTypography.label12Regular.copyWith(
                color: TColorSystem.n700,
                fontSize: 11,
              ),
              labelStyle: TTypography.body16Regular.copyWith(
                color: TColorSystem.n600,
              ),
              errorStyle: TTypography.label12Bold.copyWith(
                color: const Color(0xFFEA2A2A),
                fontSize: 12,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: TColorSystem.n600),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: TColorSystem.primary500,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Colors.red, width: 2),
              ),
              prefixIconConstraints: const BoxConstraints(
                minHeight: 20,
                minWidth: 20 + 8,
              ),
              suffixIconConstraints: const BoxConstraints(
                minHeight: 20,
                minWidth: 20 + 32, // Add 12 for spacing from right
              ),
            ),
          ),
        ],
      ),
    );
  }
}
