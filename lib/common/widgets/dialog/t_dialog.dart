import 'package:flutter/material.dart';

import '../../../utils/constants/color_system.dart';
import '../../../utils/constants/typography.dart';
import '../buttons/extensible_hug_content_button.dart';

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
            TExtensibleHugContentButton(
              buttonLabel: buttonLabel,
              onPressed: onTapPrimaryAction,
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
