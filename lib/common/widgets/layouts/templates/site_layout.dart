import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../responsive/responsive_design.dart';
import '../../responsive/screens/desktop_layout.dart';
import '../../responsive/screens/mobile_layout.dart';
import '../../responsive/screens/tablet_layout.dart';

/// Template for the overall site layout, responsive to different screen sizes
class TSiteTemplate extends StatelessWidget {
  const TSiteTemplate({
    super.key,
    this.desktop,
    this.tablet,
    this.mobile,
    this.useLayout = true,  this.showNavRail = true,  this.showHeader2 = true,
  });

  /// Widget for desktop layout
  final Widget? desktop;

  /// Widget for tablet layout
  final Widget? tablet;

  /// Widget for mobile layout
  final Widget? mobile;

  /// Flag to determine whether to use the layout
  final bool useLayout;


  /// Flag to determine whether to use the layout
  final bool showHeader2;

  /// Flag to determine if to show Nav Rail
  final bool showNavRail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primaryBackground,
      body: TResponsiveWidget(
        desktop:
        useLayout ? DesktopLayout(body: desktop, showNavRail: showNavRail,) : desktop ?? Container(),
        tablet: useLayout
            ? TabletLayout(body: tablet ?? desktop)
            : tablet ?? desktop ?? Container(),
        mobile: useLayout
            ? MobileLayout( body: mobile ?? desktop)
            : mobile ?? desktop ?? Container(),
      ),
    );
  }
}
