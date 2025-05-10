import 'package:cwt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/color_system.dart';
import '../../../utils/constants/typography.dart';

class TAlertDialog extends StatelessWidget {
  final dynamic Function() onTapPrimaryAction;
  final String title;
  final String message;
  final String buttonLabel;

  const TAlertDialog({
    super.key,

    required this.title,
    required this.message,
    required this.buttonLabel,
    required this.onTapPrimaryAction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TTypography.h3.copyWith(color: TColorSystem.n200, fontSize: 16),
          ),
        ],
      ),
      content: Text(
        message,
        style: TTypography.label12Regular.copyWith(color: TColorSystem.n200),
      ),
      actions: [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Pushes buttons apart
          children: [
            SizedBox(
              width: TSizes.buttonWidth,
              child: ElevatedButton(
                onPressed: onTapPrimaryAction,
                child: Text( buttonLabel),
              ),
            ),

            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Back'),
            ),
          ],
        ),
      ],
    );
  }
}
