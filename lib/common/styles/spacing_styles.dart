import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class TSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: TSizes.appBarHeight,
    left: TSizes.defaultSpaceDesktop,
    bottom: TSizes.defaultSpaceDesktop,
    right: TSizes.defaultSpaceDesktop,
  );
}
