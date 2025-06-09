import 'package:flutter/material.dart';
import '../../layouts/headers/desktop_header.dart';
import '../../layouts/sidebars/sidebar.dart';


/// Widget for the desktop layout
class DesktopLayout extends StatelessWidget {
  DesktopLayout({
    super.key,
    this.body,
  });

  final Widget? body;


  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const TSidebar(),
      body: Row(
        children: [

          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // Header
                DesktopHeader(scaffoldKey: scaffoldKey),
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
