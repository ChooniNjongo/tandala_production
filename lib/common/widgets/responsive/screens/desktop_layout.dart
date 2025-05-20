import 'package:flutter/material.dart';
import '../../layouts/headers/mobile_header.dart';
import '../../layouts/sidebars/sidebar.dart';
import '../../navigation/nav_rail.dart';

/// Widget for the desktop layout
class DesktopLayout extends StatelessWidget {
  DesktopLayout({
    super.key,
    this.body, required this.showNavRail,
  });

  final Widget? body;
  final bool showNavRail;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const TSidebar(),
      body: Row(
        children: [
          // Navigation Rail
          Visibility(
              visible: showNavRail,
              child: NavRail(scaffoldKey: scaffoldKey)),
          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // Header
                MobileHeader(scaffoldKey: scaffoldKey),
                // Body
                Expanded(child: body ?? const SizedBox()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
