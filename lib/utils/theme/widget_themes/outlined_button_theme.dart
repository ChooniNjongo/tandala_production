import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.primaryBackground,
      side: const BorderSide(color: TColors.borderPrimary),
      padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
      textStyle: const TextStyle(fontSize: 16, color: TColors.black, fontWeight: FontWeight.w600, fontFamily: 'Urbanist'),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: TColors.light,
      side: const BorderSide(color: TColors.borderPrimary),
      padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.buttonRadius)),
      textStyle: const TextStyle(fontSize: 16, color: TColors.textWhite, fontWeight: FontWeight.w600, fontFamily: 'Urbanist'),
    ),
  );
}
