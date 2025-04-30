import 'package:flutter/material.dart';
import '../../../../utils/constants/color_system.dart';
import '../../../../utils/constants/typography.dart';
import '../../../../utils/device/device_utility.dart';

class FooterLink extends StatelessWidget {
  final String title;

  const FooterLink({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isMobile = TDeviceUtils.isMobileScreen(context);
    return Text(
      title,
      style: TTypography.body12Regular.copyWith(fontSize:isMobile? 11:12, color: TColorSystem.n500),
    );
  }
}
