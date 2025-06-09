import 'package:flutter/material.dart';

/// Widget for the desktop layout
class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       // bottomNavigationBar: const NavBar(),
        body: Column(children: [
          Expanded(child: body ?? const SizedBox())]),
      ),
    );
  }
}
